#include "judger.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// If called this function receives 3 String and it returns one as soon as it's done
char* run_judge(const char* usersCode, const char* programmingLanguage, const char* solution) {
    char* fileName;
    
    // TODO Perform the file generation & compilation depending on the used language
    if (programmingLanguage == ".c") {
        // Write the users code into a file with the correct ending of the language he used
        fileName = writeFile(usersCode, programmingLanguage);
        if (fileName == "-1"){
            return "-1";
        }
        free(fileName);
    } else if (programmingLanguage == ".java") {
        // Write the users code into a file with the correct ending of the language he used
        fileName = writeFile(usersCode, programmingLanguage);
        if (fileName == "-1"){
            return "-1";
        }
        free(fileName);
    } else if (programmingLanguage == ".py") {
        // Write the users code into a file with the correct ending of the language he used
        fileName = writeFile(usersCode, programmingLanguage);
        if (fileName == "-1"){
            return "-1";
        }
        free(fileName);
    } else if (programmingLanguage == ".cpp") {
        // Write the users code into a file with the correct ending of the language he used
        fileName = writeFile(usersCode, programmingLanguage);
        if (fileName == "-1"){
            return "-1";
        }
        free(fileName);
    } else {
        printf("ERROR: Undefined language (Code 1)\n");
        return "1";
    }

    // TODO Call the compiler and pass the file with the users code
    // TODO Filter the compilers output
    //          - Syntax errors: Return message "Syntax errors. Did you select the correct language?"
    //          - Wrong results: Return message "Wrong results"
    //          - Correct solution: Return message "Succes!"
    // TODO Delete the file with the users Code
    // TODO Quit
}

// Generate a file and write its content
char* writeFile(char* content, char* ending){
    // Generate the correct file name depending on the langugae the user used
    size_t len = 8 + strlen(ending);
    char* fileName = malloc(len);
    strcpy(fileName, "UserCode");
    strcat(fileName, ending);

    // Generate a new file or override an existing one
    FILE *userFile = fopen("", "w");
    if (userFile == NULL){
        printf("ERROR: Unable to generate the file (Code -1)\n");
        return "-1";
    }
    
    // Write the content
    fprintf(userFile, content);
    fclose(userFile);

    // Return the correct file name
    return fileName;
}
