/*  Copyright 2026 Fabian Roland (naibaf-1)

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License. */

#ifndef JUDGER_H
#define JUDGER_H

#ifdef __cplusplus
extern "C" {
#endif

// Main function of my library: Returns a String in C => Flutter can read it via FFI
char* runJudge(const char* usersCode, const char* programmingLanguage, const char* solution);

// Internal helper functions
char* writeFile(const char* content, const char* ending);
int callCompiler(char* fileName, char* instruction);
char* runProgramAndCalculateTheScore(char* correctSolution, char* instruction);
void trimNewline(char* s);

#ifdef __cplusplus
}
#endif
#endif
