#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main() {
  pid_t pid = fork();
  /* error */
  if (pid < 0) {
    printf("Fork Failed");
    return 1;
  } else if (pid == 0) {
    /* child process */
    if (pid == 0) {
      pid_t pid2 = fork();
      if (pid2 == 0) {
            int p_id = getpid(); /*process id*/
        // grandchild (of top-level parent)
          printf("Grandchild 1:\n");
          printf("Process ID: %d\n", p_id);
          execlp("ps","-e");
      } 
      wait();
      if(pid2>0) {
        // parent of the grandchild
        pid_t pid3 = fork();
        if (pid3 == 0) {
            int p_id = getpid(); /*process id*/
            printf("\nGrandchild 2:\n");
            printf("Process ID: %d\n", p_id);
        execlp("cat","/etc/passwd");
          // grandchild 2 (of top-level parent)
        }
      }

    }

  }
  return 0;
} 
