#include <stdio.h>

#include <system_server.h>
#include <gui.h>
#include <input.h>
#include <web_server.h>

int create_gui()
{
    pid_t systemPid;

    printf("여기서 GUI 프로세스를 생성합니다.\n");

    sleep(3);

    if(!(systemPid = fork()))
        execl("/usr/bin/firefox", "firefox", "http://localhost:8282", NULL);

    return 0;
}
