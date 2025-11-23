#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>

int main() {
    pid_t child_pid;
    
    printf("=== Exercise 3: Stopping Processes ===\n\n");
    
    child_pid = fork();
    
    if (child_pid < 0) {
        fprintf(stderr, "Fork failed!\n");
        return 1;
    }
    else if (child_pid == 0) {
        printf("Child process started. PID: %d\n", getpid());
        printf("Child will sleep for 30 seconds...\n");

        sleep(30);

        printf("Child process completed normally.\n");
        exit(0);
    }
    else {
        printf("Parent process. Created child with PID: %d\n", child_pid);

        printf("Letting child run for 3 seconds...\n");
        sleep(3);

        printf("\nStopping child process (PID: %d) using kill(SIGTERM)...\n", child_pid);
        
        if (kill(child_pid, SIGTERM) == 0) {
            printf("SIGTERM sent successfully to PID: %d\n", child_pid);
        } else {
            perror("kill failed");
        }

        int status;
        waitpid(child_pid, &status, 0);
        
        if (WIFSIGNALED(status)) {
            printf("Child was terminated by signal: %d\n", WTERMSIG(status));
        }
        
        printf("\nVerifying process is stopped...\n");

        if (kill(child_pid, 0) == -1) {
            printf("Process %d is no longer running. ✓\n", child_pid);
        } else {
            printf("Process %d is still running.\n", child_pid);
        }
        
        printf("\nParent exiting.\n");
    }
    
    return 0;
}
