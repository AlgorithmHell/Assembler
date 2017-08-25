#define _CRT_SECURE_NO_WARNINGS
#include <iostream>
#include <string>
using namespace std;


extern "C"
{
	int _stdcall TheShortestWordLength(char*String,int length);
	char* _stdcall SubString(char*String,int StrLen, char*SubString, int SubStrLen);
	wchar_t* _stdcall Remove(wchar_t*String, int StrLen);
	int _stdcall StrTok(wchar_t*Dest, int DestLen,wchar_t*Buf,int pointer);
}


int main()
{
	//char str[] = "fhdfjd fgffffsfg f shfdjdhf sjjfdsfds ";
	//cout << str << endl;
	//int Strlen = strlen(str);
	//int lengthh = 0;
	//int buf = lengthh;
	//int length = 0;
	//
	//cout << TheShortestWordLength(str, strlen(str));
	//cout<< endl << endl;

	//char strs[] = "A look in somebody's eyes to light up the skies to open the world and send it reeling ";
	//char subb[] = "light up the skies";
	//int subLength = strlen(subb);
	//int strLen = strlen(strs);
	//cout << strs << endl<<endl;
	////char*pointer=new char[strlen(SubString(strs, strLen, subb, subLength) )];
	///*for (int i = 0 esi; i < strlen(strs - parameter of func); i++)
	//{
	//	int k = 0;ecx
	//				
	//		for (int j = iedi=esi; k-ecx != strlen(sub)parameter of func; k++ ecx, j++ edi)
	//		{
	//			if (strs ebx[edi][j] != sub[k]edx[ecx])break;
	//		}

	//	
	//	if (k ecx == strlen(sub))
	//	{
	//		pointer = i esi;
	//		break;
	//	}
	//}*/
	///*_asm
	//{
	//	lea ebx, strs
	//	lea edx, subb
	//	mov esi,-1
	//	mov eax,-10
	//	CycleOne:
	//	inc esi
	//		cmp esi, strLen
	//		JE Endd
	//		mov ecx,-1
	//		mov edi, esi
	//		dec edi
	//		CycleTwo:
	//	inc edi
	//		inc ecx
	//		cmp ecx, subLength
	//		JE Next
	//		push eax
	//		mov al, [ebx][edi]
	//		cmp al, [edx][ecx]
	//		pop eax
	//		JNE Next
	//		jmp CycleTwo


	//		Next:
	//	cmp ecx, subLength
	//		
	//		JNE CycleOne
	//		
	//		cmp [ebx][edi], ' '
	//		JNE CycleOne
	//		mov eax, esi
	//		Endd:
	//	cmp eax,-10
	//		JE VeryEnd
	//	mov pointer,eax
	//		jmp TheEnd
	//		VeryEnd:
	//	mov pointer, -1
	//		TheEnd:
	//		
	//}*/
	////strcpy(SubString(strs, strLen, subb, subLength), pointer);
	////cout << "Pointer to the : " << ends << subb << ends << " - " << pointer << endl<<endl;

	//char zh[] = "aa(bbb)cccc(d)";
	//cout << zh << endl;
	///*for (int i = 0; i < strlen(zh); i++)
	//{
	//	if (zh[i] == '(')
	//	{
	//		int j = i;
	//		for (; j <= strlen(zh); j++)
	//		{
	//			
	//			if (zh[j] == ')')
	//				break;
	//		}
	//		
	//		int SaveI = i;
	//		for (int k = ++j; k <= strlen(zh); k++, i++)
	//		{
	//			zh[i] = zh[k];
	//		}
	//		i = SaveI;
	//	}
	//}*/
	////Remove(zh, strlen(zh));
	//cout << zh << endl << endl;

	wchar_t name[] = L"G:\\Users\\Note\\Desktop\\Todo";
	wcout << name << endl;
	wstring Data=Remove(name, 29);
	wchar_t *hdj= new wchar_t[Data.length()];
	wcscpy(hdj, Data.c_str());
	 wcout << hdj << endl;
	 
	 int pointer = -1;
	 int i = 0;
	 wchar_t Buffer[20][20] = { 0 };
	 while (pointer <= 25)
	 {
		 
		 pointer=StrTok(hdj, Data.length(), Buffer[i], pointer);
		 wcout << Buffer[i] << endl;
		 i++;
	 }
	 
		 return 0;
}
