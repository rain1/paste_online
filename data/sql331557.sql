-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Masin: localhost
-- Tegemisaeg: 19.03.2014 kell 18:01:24
-- Serveri versioon: 5.5.16
-- PHP versioon: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Andmebaas: `paste`
--

-- --------------------------------------------------------

--
-- Struktuur tabelile `pastes`
--

DROP TABLE IF EXISTS `pastes`;
CREATE TABLE IF NOT EXISTS `pastes` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `uid` int(15) NOT NULL,
  `paste` longtext NOT NULL,
  `title` varchar(100) NOT NULL,
  `language` varchar(10) NOT NULL,
  `created` int(15) NOT NULL,
  `expiration` int(15) NOT NULL,
  `exposure` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Tabeli andmete salvestamine `pastes`
--

INSERT INTO `pastes` (`id`, `uid`, `paste`, `title`, `language`, `created`, `expiration`, `exposure`) VALUES
(2, 38, 'sadsa', 'asd', 'php', 1395071029, 2147483647, 0),
(3, 38, 'Tere tere vanakere', 'Test', 'plain', 1395071167, 1395074767, 1),
(4, 1, 'test', 'test', 'delphi', 1395175023, 1396384623, 1),
(5, 1, 'a="\\""\r\nb=''\\''''', '\\\\''a', 'as3', 1395175392, 2147483647, 0),
(6, 1, '// Win32Project4.cpp : Defines the entry point for the application.\r\n//\r\n\r\n#include "stdafx.h"\r\n#include "Win32Project5.h"\r\n\r\n#define MAX_LOADSTRING 100\r\n\r\n// Global Variables:\r\nHINSTANCE hInst;								// current instance\r\nTCHAR szTitle[MAX_LOADSTRING];					// The title bar text\r\nTCHAR szWindowClass[MAX_LOADSTRING];			// the main window class name\r\n\r\n// Forward declarations of functions included in this code module:\r\nATOM				MyRegisterClass(HINSTANCE hInstance);\r\nATOM				MyRegisterWindow(HINSTANCE hInstance);\r\nBOOL				InitInstance(HINSTANCE, int);\r\nLRESULT CALLBACK	WndProc(HWND, UINT, WPARAM, LPARAM);\r\nINT_PTR CALLBACK	About(HWND, UINT, WPARAM, LPARAM);\r\nLRESULT CALLBACK WndProcWindow(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam);\r\nHWND child[15];\r\ndouble wym[15];\r\nPOINT tab[15];\r\nHWND hWnd;\r\n\r\nint APIENTRY _tWinMain(_In_ HINSTANCE hInstance,\r\n                     _In_opt_ HINSTANCE hPrevInstance,\r\n                     _In_ LPTSTR    lpCmdLine,\r\n                     _In_ int       nCmdShow)\r\n{\r\n	UNREFERENCED_PARAMETER(hPrevInstance);\r\n	UNREFERENCED_PARAMETER(lpCmdLine);\r\n\r\n 	// TODO: Place code here.\r\n	MSG msg;\r\n	HACCEL hAccelTable;\r\n\r\n	// Initialize global strings\r\n	LoadString(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);\r\n	LoadString(hInstance, IDC_WIN32PROJECT5, szWindowClass, MAX_LOADSTRING);\r\n	MyRegisterClass(hInstance);\r\n	MyRegisterWindow(hInstance);\r\n\r\n	// Perform application initialization:\r\n	if (!InitInstance (hInstance, nCmdShow))\r\n	{\r\n		return FALSE;\r\n	}\r\n\r\n	hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_WIN32PROJECT5));\r\n\r\n	// Main message loop:\r\n	while (GetMessage(&msg, NULL, 0, 0))\r\n	{\r\n		if (!TranslateAccelerator(msg.hwnd, hAccelTable, &msg))\r\n		{\r\n			TranslateMessage(&msg);\r\n			DispatchMessage(&msg);\r\n		}\r\n	}\r\n\r\n	return (int) msg.wParam;\r\n}\r\n\r\n\r\n\r\n//\r\n//  FUNCTION: MyRegisterClass()\r\n//\r\n//  PURPOSE: Registers the window class.\r\n//\r\nATOM MyRegisterClass(HINSTANCE hInstance)\r\n{\r\n	WNDCLASSEX wcex;\r\n\r\n	wcex.cbSize = sizeof(WNDCLASSEX);\r\n\r\n	wcex.style			= CS_HREDRAW | CS_VREDRAW;\r\n	wcex.lpfnWndProc	= WndProc;\r\n	wcex.cbClsExtra		= 0;\r\n	wcex.cbWndExtra		= 0;\r\n	wcex.hInstance		= hInstance;\r\n	wcex.hIcon			= LoadIcon(hInstance, MAKEINTRESOURCE(IDI_WIN32PROJECT5));\r\n	wcex.hCursor		= LoadCursor(NULL, IDC_ARROW);\r\n	wcex.hbrBackground	= (HBRUSH)(COLOR_WINDOW+5);\r\n	wcex.lpszMenuName	= MAKEINTRESOURCE(IDC_WIN32PROJECT5);\r\n	wcex.lpszClassName	= szWindowClass;\r\n	wcex.hIconSm		= LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL));\r\n\r\n	return RegisterClassEx(&wcex);\r\n}\r\nATOM MyRegisterWindow(HINSTANCE hInstance)\r\n{\r\n		WNDCLASSEX wcex;\r\n \r\n	wcex.cbSize = sizeof(WNDCLASSEX);\r\n \r\n	wcex.style = CS_HREDRAW | CS_VREDRAW;\r\n	wcex.lpfnWndProc = WndProcWindow;\r\n	wcex.cbClsExtra = 0;\r\nwcex.cbWndExtra = 0;\r\nwcex.hInstance = hInstance;\r\nwcex.hIcon = 0;\r\nwcex.hCursor = LoadCursor(NULL, IDC_ARROW);\r\nwcex.hbrBackground = (HBRUSH)(COLOR_ACTIVECAPTION+1);\r\nwcex.lpszMenuName = 0;\r\nwcex.lpszClassName = L"klasa";\r\nwcex.hIconSm = 0;\r\n \r\nreturn RegisterClassEx(&wcex);\r\n}\r\n\r\n//\r\n//   FUNCTION: InitInstance(HINSTANCE, int)\r\n//\r\n//   PURPOSE: Saves instance handle and creates main window\r\n//\r\n//   COMMENTS:\r\n//\r\n//        In this function, we save the instance handle in a global variable and\r\n//        create and display the main program window.\r\n//\r\nBOOL InitInstance(HINSTANCE hInstance, int nCmdShow)\r\n{\r\n   hInst = hInstance; // Store instance handle in our global variable\r\n\r\n   hWnd = CreateWindow(szWindowClass, szTitle, WS_OVERLAPPEDWINDOW,\r\n      CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, NULL, NULL, hInstance, NULL);\r\n\r\n  \r\n   if (!hWnd)\r\n   {\r\n      return FALSE;\r\n   }\r\n   ShowWindow(hWnd, nCmdShow);\r\n   UpdateWindow(hWnd);\r\n   POINT p;\r\n   GetCursorPos(&p);\r\n   for(int i=0;i<15;i++){\r\n		double wsp = (double)i/14;\r\n	wym[i] = 5+wsp*20;\r\n	child[i] = CreateWindow(L"klasa", szTitle, WS_POPUP,\r\n	p.x-wym[i]/2, p.y-wym[i]/2, wym[i], wym[i], hWnd, NULL, hInstance, NULL);\r\n	if(!child[i]) return FALSE;\r\n \r\n	SetWindowLong(child[i], GWL_EXSTYLE, GetWindowLong(child[i], GWL_EXSTYLE) | WS_EX_LAYERED);\r\n	SetLayeredWindowAttributes(child[i], 0, 255-wsp*191, LWA_ALPHA);\r\n	tab[i]=p;\r\n	ShowWindow(child[i], nCmdShow);\r\n	UpdateWindow(child[i]);\r\n \r\n	HRGN reg = CreateEllipticRgn(0, 0, wym[i], wym[i]);\r\n	SetWindowRgn(child[i], reg, true);\r\n   }\r\n\r\n   return TRUE;\r\n}\r\n\r\n//\r\n//  FUNCTION: WndProc(HWND, UINT, WPARAM, LPARAM)\r\n//\r\n//  PURPOSE:  Processes messages for the main window.\r\n//\r\n//  WM_COMMAND	- process the application menu\r\n//  WM_PAINT	- Paint the main window\r\n//  WM_DESTROY	- post a quit message and return\r\n//\r\n\r\nLRESULT CALLBACK WndProcWindow(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)\r\n{\r\n	return DefWindowProc(hWnd, message, wParam, lParam);\r\n}\r\n//\r\nLRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)\r\n{\r\n	int wmId, wmEvent;\r\n	PAINTSTRUCT ps;\r\n	HDC hdc;\r\n	SetTimer(hWnd, 0, 50, NULL); \r\n	switch (message)\r\n	{\r\n	case WM_COMMAND:\r\n		wmId    = LOWORD(wParam);\r\n		wmEvent = HIWORD(wParam);\r\n		// Parse the menu selections:\r\n		switch (wmId)\r\n		{\r\n		case IDM_ABOUT:\r\n			DialogBox(hInst, MAKEINTRESOURCE(IDD_ABOUTBOX), hWnd, About);\r\n			break;\r\n		case IDM_EXIT:\r\n			DestroyWindow(hWnd);\r\n			break;\r\n		default:\r\n			return DefWindowProc(hWnd, message, wParam, lParam);\r\n		}\r\n		break;\r\n	case WM_PAINT:\r\n		hdc = BeginPaint(hWnd, &ps);\r\n		// TODO: Add any drawing code here...\r\n		EndPaint(hWnd, &ps);\r\n		break;\r\n	case WM_TIMER:\r\n	{\r\n		POINT p;\r\n \r\n		GetCursorPos(&p);\r\n \r\n		for(int i =14;i>0;i--)\r\n		{\r\n			tab[i]=tab[i-1];\r\n			 MoveWindow(child[i], tab[i].x-wym[i]/2, tab[i].y-wym[i]/2, wym[i], wym[i], true);\r\n\r\n		}\r\n		tab[0]=p;\r\n		MoveWindow(child[0], p.x-wym[0]/2, p.y-wym[0]/2, wym[0], wym[0], true);\r\n	}\r\n	break;\r\n	case WM_DESTROY:\r\n		PostQuitMessage(0);\r\n		break;\r\n	default:\r\n		return DefWindowProc(hWnd, message, wParam, lParam);\r\n	}\r\n	return 0;\r\n}\r\n\r\n// Message handler for about box.\r\nINT_PTR CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)\r\n{\r\n	UNREFERENCED_PARAMETER(lParam);\r\n	switch (message)\r\n	{\r\n	case WM_INITDIALOG:\r\n		return (INT_PTR)TRUE;\r\n\r\n	case WM_COMMAND:\r\n		if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL)\r\n		{\r\n			EndDialog(hDlg, LOWORD(wParam));\r\n			return (INT_PTR)TRUE;\r\n		}\r\n		break;\r\n	}\r\n	return (INT_PTR)FALSE;\r\n}', 'win32project', 'cpp', 1395177908, 2147483647, 0);

-- --------------------------------------------------------

--
-- Struktuur tabelile `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `SessionID` varchar(15) COLLATE utf8_bin NOT NULL,
  `UserID` int(11) NOT NULL,
  `IPAddress` varchar(15) COLLATE utf8_bin NOT NULL,
  `UserAgent` text COLLATE utf8_bin NOT NULL,
  `Start` int(11) NOT NULL,
  `End` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Tabeli andmete salvestamine `sessions`
--

INSERT INTO `sessions` (`SessionID`, `UserID`, `IPAddress`, `UserAgent`, `Start`, `End`) VALUES
('I2*Be([fj0({mnJ', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1393968010, 1549488010),
('d/fhGgdvKBJrF98', 38, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394016552, 1549536552),
('gP3jUg49y*FTWA!', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394017573, 1549537573),
('b7Aj/.+}5ZJ/cYa', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394017703, 1549537703),
('5[BPSY0NAQ/AjAs', 38, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394017715, 1549537715),
('iIStHxcf,fD0wa.', 38, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394017717, 1549537717),
('abHxagCk9LE)!AT', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394017723, 1549537723),
('HeJBG9GS5S(qx[&', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394017867, 1549537867),
('jGZGLp+EY$!}L*2', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394017976, 1549537976),
('@G)+lIxsf5rih-f', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018025, 1549538025),
('DFGgKddf/ta}9e.', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018143, 1549538143),
('SQ4%wZHluG&EOGD', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018183, 1549538183),
('x6Q&Sd4JjPHC/Rc', 38, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018200, 1549538200),
('@jh8Dhdls.6H(Kg', 38, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018201, 1549538201),
('jM/!)lfZudFFJ*s', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018208, 1549538208),
('axe,DxWkVjYOeIe', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018239, 1549538239),
('@TXoVxRjJWX/8AF', 38, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018249, 1549538249),
('6R4{4o5xu6.G%+.', 38, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018251, 1549538251),
('w{%X/CHdrA}nGhZ', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018255, 1549538255),
('PPKj5KK$W,0Pgb.', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018381, 1549538381),
('2F/Df}&X$ghSCIr', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018385, 1549538385),
('W/Bl[{{s[hT2smO', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018562, 1549538562),
('meRd2JDfi+SpJ2h', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018566, 1549538566),
('G8Bv(gVHd*%nMTS', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018680, 1549538680),
('H}En$T{HBreKUSs', 38, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018774, 1549538774),
('}GYwU}c8h{tCUip', 38, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394018776, 1549538776),
('bJnS-/Myjb38QcG', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394021282, 1549541282),
('WFY!Bl3DjDs*mGl', 38, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394021323, 1549541323),
('z4wC}iu%APv(M/g', 1, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394026809, 1549546809),
('!@H/A2Hq{yJZ$@&', 38, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394026892, 1549546892),
('!jaN4Q!wS28uLTc', 38, '193.40.10.178', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394026893, 1549546893),
(']nGAmzG+veiFG%A', 1, '::1', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394973083, 1550493083),
('PHJDkjHys&f3qj+', 38, '::1', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394973090, 1550493090),
('GQ0&DWr3J,I$hAm', 1, '::1', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1394973111, 1550493111),
('eUB%+jhtsXSuoiA', 1, '::1', 0x4d6f7a696c6c612f352e30202857696e646f7773204e5420362e313b20574f5736343b2072763a32372e3029204765636b6f2f32303130303130312046697265666f782f32372e30, 1395174914, 1550694914),
(']faSsOjQ4J6Ou1a', 1, '172.17.55.144', '', 1395224794, 1550744794);

-- --------------------------------------------------------

--
-- Struktuur tabelile `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `UserPassword` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `UserEmail` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `UserAvatar` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `UserJoinDate` int(11) DEFAULT NULL,
  `UserPostCount` int(11) DEFAULT NULL,
  `UserFounder` int(1) DEFAULT NULL,
  `UserAdmin` tinyint(1) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=40 ;

--
-- Tabeli andmete salvestamine `users`
--

INSERT INTO `users` (`UserID`, `UserName`, `UserPassword`, `UserEmail`, `UserAvatar`, `UserJoinDate`, `UserPostCount`, `UserFounder`, `UserAdmin`) VALUES
(1, 'guest ', '', '', '', 1318617171, 0, 0, 0),
(2, 'Exabot', '', '', '', 0, 0, 0, 0),
(3, 'Googlebot', '', '', '', 0, 0, 0, 0),
(4, 'Yahoo', '', '', '', 0, 0, 0, 0),
(5, 'msnbot', '', '', '', 0, 0, 0, 0),
(6, 'setooz', '', '', '', 0, 0, 0, 0),
(7, 'DotBot', '', '', '', 0, 0, 0, 0),
(8, 'Cityreview', '', '', '', 0, 0, 0, 0),
(9, 'SurveyBot', '', '', '', 0, 0, 0, 0),
(10, 'Twiceler', '', '', '', 0, 0, 0, 0),
(11, 'AddMe', '', '', '', 0, 0, 0, 0),
(12, 'AppEngine-Google', '', '', '', 0, 0, 0, 0),
(13, 'Baiduspider', '', '', '', 0, 0, 0, 0),
(14, 'CatchBot', '', '', '', 0, 0, 0, 0),
(15, 'Comodo-Certificates-Spider', '', '', '', 0, 0, 0, 0),
(16, 'Content Crawler', '', '', '', 0, 0, 0, 0),
(17, 'DLE_Spider.exe', '', '', '', 0, 0, 0, 0),
(18, 'EC2LinkFinder', '', '', '', 0, 0, 0, 0),
(19, 'findfiles.net', '', '', '', 0, 0, 0, 0),
(20, 'findlinks', '', '', '', 0, 0, 0, 0),
(21, 'gold crawler', '', '', '', 0, 0, 0, 0),
(22, 'GSLFbot', '', '', '', 0, 0, 0, 0),
(23, 'ia_archiver', '', '', '', 0, 0, 0, 0),
(24, 'Jyxobot', '', '', '', 0, 0, 0, 0),
(25, 'libwww-perl', '', '', '', 0, 0, 0, 0),
(26, 'Mail.Ru', '', '', '', 0, 0, 0, 0),
(27, 'bingbot', '', '', '', 0, 0, 0, 0),
(28, 'DotBot', '', '', '', 0, 0, 0, 0),
(29, 'MJ12bot', '', '', '', 0, 0, 0, 0),
(30, 'NerdByNature', '', '', '', 0, 0, 0, 0),
(31, 'ScoutJet', '', '', '', 0, 0, 0, 0),
(32, 'SISTRIX', '', '', '', 0, 0, 0, 0),
(33, 'WBSearchBot', '', '', '', 0, 0, 0, 0),
(34, 'YandexBot', '', '', '', 0, 0, 0, 0),
(35, 'YandexFavicon', '', '', '', 0, 0, 0, 0),
(36, 'TwengaBot', '', '', '', 0, 0, 0, 0),
(37, 'Google', '', '', '', 0, 0, 0, 0),
(38, 'rain ', '23678db5efde9ab46bce8c23a6d91b50', 'a@a.com', 'test2', 1318617171, 0, 0, 0),
(39, 'test', '', 'test', '', 1373302916, 0, 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
