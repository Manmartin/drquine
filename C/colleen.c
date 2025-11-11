#include <stdio.h>

/*
  Comentario fuera de main
*/

void print_it(void) {
    char *str = "#include <stdio.h>%1$c%1$c/*%1$c  Comentario fuera de main%1$c*/%1$c%1$cvoid print_it(void) {%1$c    char *str = %2$c%3$s%2$c;%1$c    printf(str, 10, 34, str);%1$c}%1$c%1$cint main(void) {%1$c    /*%1$c      Comentario dentro de main%1$c    */%1$c    print_it();%1$c    return 0;%1$c}%1$c";
    printf(str, 10, 34, str);
}

int main(void) {
    /*
      Comentario dentro de main
    */
    print_it();
    return 0;
}
