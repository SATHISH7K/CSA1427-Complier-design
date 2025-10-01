#include <stdio.h>
#include <string.h>

int main() {
    char str[200];

    printf("Enter a line: ");
    fgets(str, sizeof(str), stdin);

    // Remove newline if present
    str[strcspn(str, "\n")] = '\0';

    if (str[0] == '/' && str[1] == '/') {
        printf("This is a single-line comment.\n");
    }
    else if (str[0] == '/' && str[1] == '*') {
        int len = strlen(str);
        if (len >= 4 && str[len-2] == '*' && str[len-1] == '/')
            printf("This is a multi-line comment.\n");
        else
            printf("This is the start of a multi-line comment but not closed.\n");
    }
    else {
        printf("This is NOT a comment.\n");
    }

    return 0;
}

