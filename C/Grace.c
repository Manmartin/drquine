#include <stdio.h>
/*
  Mi unico comentario
*/
#define STR "#include <stdio.h>%1$c/*%1$c  Mi unico comentario%1$c*/%1$c#define STR %2$c%3$s%2$c%1$c#define MAIN_DECLARATION int main(void)%1$c#define START(function_declaration, str) function_declaration { FILE *fd = fopen(%2$cGrace_kid.c%2$c, %2$cw%2$c); if (fd == NULL) return 1; fprintf(fd, str, 10, 34, str); fclose(fd); return 0; }%1$c%1$cSTART(MAIN_DECLARATION, STR)%1$c"
#define MAIN_DECLARATION int main(void)
#define START(function_declaration, str) function_declaration { FILE *fd = fopen("Grace_kid.c", "w"); if (fd == NULL) return 1; fprintf(fd, str, 10, 34, str); fclose(fd); return 0; }

START(MAIN_DECLARATION, STR)
