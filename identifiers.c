#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main() {
    char str[100];
    int i = 0;

    printf("Enter an expression: ");
    fgets(str, sizeof(str), stdin);

    while (str[i] != '\0') {
        // Skip spaces
        if (str[i] == ' ' || str[i] == '\n') {
            i++;
            continue;
        }

        // If it starts with a letter -> Identifier
        if (isalpha(str[i])) {
            printf("Identifier: ");
            while (isalnum(str[i])) {  // allow letters + digits
                printf("%c", str[i]);
                i++;
            }
            printf("\n");
        }
        // If it starts with a digit -> Constant
        else if (isdigit(str[i])) {
            printf("Constant: ");
            while (isdigit(str[i])) {
                printf("%c", str[i]);
                i++;
            }
            printf("\n");
        }
        else {
            // Just skip other characters (operators, symbols etc.)
            i++;
        }
    }

    return 0;
}

