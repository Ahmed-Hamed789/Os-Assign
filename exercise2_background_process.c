#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>

int main() {
    pid_t background_pid;
    
    printf("Starting background process (sleep 10)...\n");
    
    background_pid = fork();
    
    if (background_pid < 0) {
        fprintf(stderr, "Fork failed!\n");
        return 1;
    }
    else if (background_pid == 0) {
        printf("Background process started. PID: %d\n", getpid());
        printf("Sleeping for 10 seconds...\n");
        sleep(10);
        printf("Background process (PID: %d) finished!\n", getpid());
        exit(0);
    }
    else {
        printf("Parent process. Created background process with PID: %d\n", background_pid);
        printf("Parent continues while child runs in background...\n");

        for (int i = 1; i <= 5; i++) {
            printf("Parent working... (%d/5)\n", i);
            sleep(1);
        }
        
        printf("Parent checking if background process is still running...\n");

        int status;
        pid_t result = waitpid(background_pid, &status, WNOHANG);
        
        if (result == 0) {
            printf("Background process (PID: %d) is still running.\n", background_pid);
            printf("Parent waiting for background process to complete...\n");
            waitpid(background_pid, &status, 0);
        }
        
        printf("Background process completed. Parent exiting.\n");
    }
    
    return 0;
}
