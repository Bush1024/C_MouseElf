#include<iostream>
#include<windows.h>
#define KEY_DOWN(VK_NONAME) ((GetAsyncKeyState(VK_NONAME) & 0x8000) ? 1:0) //��Ҫ
using namespace std;


int main()
{
	POINT ptB = { 0, 0 };
	LPPOINT xy = &ptB;
while (true)
{
printf("�������Ƿ��£�"); 


if(KEY_DOWN(MOUSE_MOVED))
{
	printf("��"); 
	GetCursorPos(xy);
	printf("x=%d,y=%d\n", xy->x, xy->y);
} 
else 
{
printf("��");  
}
printf("\n");  


printf("����Ҽ��Ƿ��£�");  
if(KEY_DOWN(MOUSE_EVENT))
{
printf("��");  
}
else
{
printf("��");  
}
printf("\n");  


printf("�����ּ��Ƿ��£�");  


if(KEY_DOWN(MOUSE_WHEELED))
{
printf("��");  
}
else
{printf("��");  
}
printf("\n");  


Sleep(20);//ѭ��ʱ��������ֹ̫ռ�ڴ�   
system("cls");//���� 
}
}