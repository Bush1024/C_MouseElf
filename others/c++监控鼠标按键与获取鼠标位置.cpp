#include<iostream>
#include<windows.h>
#define KEY_DOWN(VK_NONAME) ((GetAsyncKeyState(VK_NONAME) & 0x8000) ? 1:0) //必要
using namespace std;


int main()
{
	POINT ptB = { 0, 0 };
	LPPOINT xy = &ptB;
while (true)
{
printf("鼠标左键是否按下："); 


if(KEY_DOWN(MOUSE_MOVED))
{
	printf("是"); 
	GetCursorPos(xy);
	printf("x=%d,y=%d\n", xy->x, xy->y);
} 
else 
{
printf("否");  
}
printf("\n");  


printf("鼠标右键是否按下：");  
if(KEY_DOWN(MOUSE_EVENT))
{
printf("是");  
}
else
{
printf("否");  
}
printf("\n");  


printf("鼠标滚轮键是否按下：");  


if(KEY_DOWN(MOUSE_WHEELED))
{
printf("是");  
}
else
{printf("否");  
}
printf("\n");  


Sleep(20);//循环时间间隔，防止太占内存   
system("cls");//清屏 
}
}