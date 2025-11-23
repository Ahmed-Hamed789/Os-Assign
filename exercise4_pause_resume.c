#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>

int main() {
    pid_t child_pid;
    
    printf("=== Exercise 4: Pausing and Resuming a Process ===\n\n");
    
    child_pid = fork();
    
    if (child_pid < 0) {
        fprintf(stderr, "Fork failed!\n");
        return 1;
    }
    else if (child_pid == 0) {
        
        printf("Child process started. PID: %d\n", getpid());
        printf("Child will count to 20...\n\n");
        
        for (int i = 1; i <= 20; i++) {
            printf("Child counting: %d\n", i);
            sleep(1);
        }
        
        printf("\nChild process completed.\n");
        exit(0);
    }
    else {
       
        printf("Parent process. Created child with PID: %d\n\n", child_pid);
        
        
        printf("Letting child run for 3 seconds...\n");
        sleep(3);
        
       
        printf("\n>>> PAUSING child process (PID: %d) using SIGSTOP...\n", child_pid);
        
        if (kill(child_pid, SIGSTOP) == 0) {
            printf("Child process paused successfully. ⏸\n");
        } else {
            perror("Failed to pause");
        }
        
       
        printf("\nChild is paused. Parent doing other work for 5 seconds...\n");
        for (int i = 1; i <= 5; i++) {
            printf("Parent working while child is paused... (%d/5)\n", i);
            sleep(1);
        }
        
       
        printf("\n>>> RESUMING child process (PID: %d) using SIGCONT...\n", child_pid);
        
        if (kill(child_pid, SIGCONT) == 0) {
            printf("Child process resumed successfully. ▶\n\n");
        } else {
            perror("Failed to resume");
        }
        
        
        printf("Waiting for child to finish counting...\n\n");
        int status;
        waitpid(child_pid, &status, 0);
        
        if (WIFEXITED(status)) {
            printf("\nChild exited normally with status: %d\n", WEXITSTATUS(status));
        }
        
        printf("Parent exiting.\n");
    }
    
    return 0;
}
