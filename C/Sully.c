#include <stdlib.h>
#include <stdio.h>

int main(void) {
    char execname[17];
    char filename[19];
    char command[200];
    char *str = "#include <stdlib.h>%1$c#include <stdio.h>%1$c%1$cint main(void) {%1$c    char execname[17];%1$c    char filename[19];%1$c    char command[200];%1$c    char *str = %2$c%3$s%2$c;%1$c%1$c    int i = %4$i;%1$c    if (i <= 0)%1$c        return 0;%1$c    #ifdef CHILD%1$c    --i;%1$c    #endif%1$c    sprintf(execname, %2$cSully_%%i%2$c, i);%1$c    sprintf(filename, %2$c%%s.c%2$c, execname);%1$c    sprintf(command, %2$cgcc -DCHILD %%1$s -o %%2$s; ./%%2$s%2$c, filename, execname);%1$c%1$c    FILE *fd = fopen(filename, %2$cw%2$c);%1$c    if (fd == NULL)%1$c        return 1;%1$c    fprintf(fd, str, 10, 34, str, i);%1$c    fclose(fd);%1$c    system(command);%1$c%1$c    return 0;%1$c}%1$c";

    int i = 5;
    if (i <= 0)
        return 0;
    #ifdef CHILD
    --i;
    #endif
    sprintf(execname, "Sully_%i", i);
    sprintf(filename, "%s.c", execname);
    sprintf(command, "gcc -DCHILD %1$s -o %2$s; ./%2$s", filename, execname);

    FILE *fd = fopen(filename, "w");
    if (fd == NULL)
        return 1;
    fprintf(fd, str, 10, 34, str, i);
    fclose(fd);
    system(command);

    return 0;
}
