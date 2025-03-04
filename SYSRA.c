//Thank you for Leonardo Ono
// GIT LINK : https://github.com/leonardo-ono/Assembly8086KeyboardInputHandlerINT9h  

extern void far install_key_handler();
extern void far uninstall_key_handler();
extern int far is_key_pressed(int code);

void far Setup();
void far FrameUpdate();
void far Input(int a, int b, int c);

int main()
{
	install_key_handler();
	Setup();
	while (!is_key_pressed(1))
	{
		Input(is_key_pressed('K'), is_key_pressed('M'), (is_key_pressed(',') || is_key_pressed('H')));
		FrameUpdate();
	}
	uninstall_key_handler();
}