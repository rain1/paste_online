-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Loomise aeg: Märts 26, 2014 kell 04:09 PM
-- Serveri versioon: 5.5.35-log
-- PHP versioon: 5.3.28

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Andmebaas: `np10124_po`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `pastes`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

--
-- Andmete tõmmistamine tabelile `pastes`
--

INSERT INTO `pastes` (`id`, `uid`, `paste`, `title`, `language`, `created`, `expiration`, `exposure`) VALUES
(2, 38, 'sadsa', 'asd', 'php', 1395071029, 2147483647, 0),
(3, 38, 'Tere tere vanakere', 'Test', 'plain', 1395071167, 1395074767, 1),
(4, 1, 'test', 'test', 'delphi', 1395175023, 1396384623, 1),
(5, 1, 'a="\\""\r\nb=''\\''''', '\\\\''a', 'as3', 1395175392, 2147483647, 0),
(6, 1, '// Win32Project4.cpp : Defines the entry point for the application.\r\n//\r\n\r\n#include "stdafx.h"\r\n#include "Win32Project5.h"\r\n\r\n#define MAX_LOADSTRING 100\r\n\r\n// Global Variables:\r\nHINSTANCE hInst;								// current instance\r\nTCHAR szTitle[MAX_LOADSTRING];					// The title bar text\r\nTCHAR szWindowClass[MAX_LOADSTRING];			// the main window class name\r\n\r\n// Forward declarations of functions included in this code module:\r\nATOM				MyRegisterClass(HINSTANCE hInstance);\r\nATOM				MyRegisterWindow(HINSTANCE hInstance);\r\nBOOL				InitInstance(HINSTANCE, int);\r\nLRESULT CALLBACK	WndProc(HWND, UINT, WPARAM, LPARAM);\r\nINT_PTR CALLBACK	About(HWND, UINT, WPARAM, LPARAM);\r\nLRESULT CALLBACK WndProcWindow(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam);\r\nHWND child[15];\r\ndouble wym[15];\r\nPOINT tab[15];\r\nHWND hWnd;\r\n\r\nint APIENTRY _tWinMain(_In_ HINSTANCE hInstance,\r\n                     _In_opt_ HINSTANCE hPrevInstance,\r\n                     _In_ LPTSTR    lpCmdLine,\r\n                     _In_ int       nCmdShow)\r\n{\r\n	UNREFERENCED_PARAMETER(hPrevInstance);\r\n	UNREFERENCED_PARAMETER(lpCmdLine);\r\n\r\n 	// TODO: Place code here.\r\n	MSG msg;\r\n	HACCEL hAccelTable;\r\n\r\n	// Initialize global strings\r\n	LoadString(hInstance, IDS_APP_TITLE, szTitle, MAX_LOADSTRING);\r\n	LoadString(hInstance, IDC_WIN32PROJECT5, szWindowClass, MAX_LOADSTRING);\r\n	MyRegisterClass(hInstance);\r\n	MyRegisterWindow(hInstance);\r\n\r\n	// Perform application initialization:\r\n	if (!InitInstance (hInstance, nCmdShow))\r\n	{\r\n		return FALSE;\r\n	}\r\n\r\n	hAccelTable = LoadAccelerators(hInstance, MAKEINTRESOURCE(IDC_WIN32PROJECT5));\r\n\r\n	// Main message loop:\r\n	while (GetMessage(&msg, NULL, 0, 0))\r\n	{\r\n		if (!TranslateAccelerator(msg.hwnd, hAccelTable, &msg))\r\n		{\r\n			TranslateMessage(&msg);\r\n			DispatchMessage(&msg);\r\n		}\r\n	}\r\n\r\n	return (int) msg.wParam;\r\n}\r\n\r\n\r\n\r\n//\r\n//  FUNCTION: MyRegisterClass()\r\n//\r\n//  PURPOSE: Registers the window class.\r\n//\r\nATOM MyRegisterClass(HINSTANCE hInstance)\r\n{\r\n	WNDCLASSEX wcex;\r\n\r\n	wcex.cbSize = sizeof(WNDCLASSEX);\r\n\r\n	wcex.style			= CS_HREDRAW | CS_VREDRAW;\r\n	wcex.lpfnWndProc	= WndProc;\r\n	wcex.cbClsExtra		= 0;\r\n	wcex.cbWndExtra		= 0;\r\n	wcex.hInstance		= hInstance;\r\n	wcex.hIcon			= LoadIcon(hInstance, MAKEINTRESOURCE(IDI_WIN32PROJECT5));\r\n	wcex.hCursor		= LoadCursor(NULL, IDC_ARROW);\r\n	wcex.hbrBackground	= (HBRUSH)(COLOR_WINDOW+5);\r\n	wcex.lpszMenuName	= MAKEINTRESOURCE(IDC_WIN32PROJECT5);\r\n	wcex.lpszClassName	= szWindowClass;\r\n	wcex.hIconSm		= LoadIcon(wcex.hInstance, MAKEINTRESOURCE(IDI_SMALL));\r\n\r\n	return RegisterClassEx(&wcex);\r\n}\r\nATOM MyRegisterWindow(HINSTANCE hInstance)\r\n{\r\n		WNDCLASSEX wcex;\r\n \r\n	wcex.cbSize = sizeof(WNDCLASSEX);\r\n \r\n	wcex.style = CS_HREDRAW | CS_VREDRAW;\r\n	wcex.lpfnWndProc = WndProcWindow;\r\n	wcex.cbClsExtra = 0;\r\nwcex.cbWndExtra = 0;\r\nwcex.hInstance = hInstance;\r\nwcex.hIcon = 0;\r\nwcex.hCursor = LoadCursor(NULL, IDC_ARROW);\r\nwcex.hbrBackground = (HBRUSH)(COLOR_ACTIVECAPTION+1);\r\nwcex.lpszMenuName = 0;\r\nwcex.lpszClassName = L"klasa";\r\nwcex.hIconSm = 0;\r\n \r\nreturn RegisterClassEx(&wcex);\r\n}\r\n\r\n//\r\n//   FUNCTION: InitInstance(HINSTANCE, int)\r\n//\r\n//   PURPOSE: Saves instance handle and creates main window\r\n//\r\n//   COMMENTS:\r\n//\r\n//        In this function, we save the instance handle in a global variable and\r\n//        create and display the main program window.\r\n//\r\nBOOL InitInstance(HINSTANCE hInstance, int nCmdShow)\r\n{\r\n   hInst = hInstance; // Store instance handle in our global variable\r\n\r\n   hWnd = CreateWindow(szWindowClass, szTitle, WS_OVERLAPPEDWINDOW,\r\n      CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, NULL, NULL, hInstance, NULL);\r\n\r\n  \r\n   if (!hWnd)\r\n   {\r\n      return FALSE;\r\n   }\r\n   ShowWindow(hWnd, nCmdShow);\r\n   UpdateWindow(hWnd);\r\n   POINT p;\r\n   GetCursorPos(&p);\r\n   for(int i=0;i<15;i++){\r\n		double wsp = (double)i/14;\r\n	wym[i] = 5+wsp*20;\r\n	child[i] = CreateWindow(L"klasa", szTitle, WS_POPUP,\r\n	p.x-wym[i]/2, p.y-wym[i]/2, wym[i], wym[i], hWnd, NULL, hInstance, NULL);\r\n	if(!child[i]) return FALSE;\r\n \r\n	SetWindowLong(child[i], GWL_EXSTYLE, GetWindowLong(child[i], GWL_EXSTYLE) | WS_EX_LAYERED);\r\n	SetLayeredWindowAttributes(child[i], 0, 255-wsp*191, LWA_ALPHA);\r\n	tab[i]=p;\r\n	ShowWindow(child[i], nCmdShow);\r\n	UpdateWindow(child[i]);\r\n \r\n	HRGN reg = CreateEllipticRgn(0, 0, wym[i], wym[i]);\r\n	SetWindowRgn(child[i], reg, true);\r\n   }\r\n\r\n   return TRUE;\r\n}\r\n\r\n//\r\n//  FUNCTION: WndProc(HWND, UINT, WPARAM, LPARAM)\r\n//\r\n//  PURPOSE:  Processes messages for the main window.\r\n//\r\n//  WM_COMMAND	- process the application menu\r\n//  WM_PAINT	- Paint the main window\r\n//  WM_DESTROY	- post a quit message and return\r\n//\r\n\r\nLRESULT CALLBACK WndProcWindow(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)\r\n{\r\n	return DefWindowProc(hWnd, message, wParam, lParam);\r\n}\r\n//\r\nLRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)\r\n{\r\n	int wmId, wmEvent;\r\n	PAINTSTRUCT ps;\r\n	HDC hdc;\r\n	SetTimer(hWnd, 0, 50, NULL); \r\n	switch (message)\r\n	{\r\n	case WM_COMMAND:\r\n		wmId    = LOWORD(wParam);\r\n		wmEvent = HIWORD(wParam);\r\n		// Parse the menu selections:\r\n		switch (wmId)\r\n		{\r\n		case IDM_ABOUT:\r\n			DialogBox(hInst, MAKEINTRESOURCE(IDD_ABOUTBOX), hWnd, About);\r\n			break;\r\n		case IDM_EXIT:\r\n			DestroyWindow(hWnd);\r\n			break;\r\n		default:\r\n			return DefWindowProc(hWnd, message, wParam, lParam);\r\n		}\r\n		break;\r\n	case WM_PAINT:\r\n		hdc = BeginPaint(hWnd, &ps);\r\n		// TODO: Add any drawing code here...\r\n		EndPaint(hWnd, &ps);\r\n		break;\r\n	case WM_TIMER:\r\n	{\r\n		POINT p;\r\n \r\n		GetCursorPos(&p);\r\n \r\n		for(int i =14;i>0;i--)\r\n		{\r\n			tab[i]=tab[i-1];\r\n			 MoveWindow(child[i], tab[i].x-wym[i]/2, tab[i].y-wym[i]/2, wym[i], wym[i], true);\r\n\r\n		}\r\n		tab[0]=p;\r\n		MoveWindow(child[0], p.x-wym[0]/2, p.y-wym[0]/2, wym[0], wym[0], true);\r\n	}\r\n	break;\r\n	case WM_DESTROY:\r\n		PostQuitMessage(0);\r\n		break;\r\n	default:\r\n		return DefWindowProc(hWnd, message, wParam, lParam);\r\n	}\r\n	return 0;\r\n}\r\n\r\n// Message handler for about box.\r\nINT_PTR CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)\r\n{\r\n	UNREFERENCED_PARAMETER(lParam);\r\n	switch (message)\r\n	{\r\n	case WM_INITDIALOG:\r\n		return (INT_PTR)TRUE;\r\n\r\n	case WM_COMMAND:\r\n		if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL)\r\n		{\r\n			EndDialog(hDlg, LOWORD(wParam));\r\n			return (INT_PTR)TRUE;\r\n		}\r\n		break;\r\n	}\r\n	return (INT_PTR)FALSE;\r\n}', 'win32project', 'cpp', 1395177908, 2147483647, 0),
(20, 1, 'dfas', '', 'as3', 1395313311, 2147483647, 0),
(21, 1, 'Stenveri mega paste', '', 'as3', 1395313331, 2147483647, 0),
(22, 1, 'Stenveri mega paste', 'tere', 'as3', 1395313344, 2147483647, 0),
(23, 1, 'Stenveri mega paste', 'WOOHOO', 'as3', 1395313359, 2147483647, 0),
(24, 1, 'test', '!test', 'as3', 1395313549, 2147483647, 0),
(25, 1, 'klklkjkl', '', 'as3', 1395761323, 2147483647, 0),
(26, 1, 'hjk', 'Ã¶lklÃ¶Ã¶l', 'as3', 1395828330, 2147483647, 0),
(27, 1, 'Test 54', 'Test54', 'as3', 1395834093, 2147483647, 0),
(38, 54, 'test', 'FB', 'as3', 1395842557, 2147483647, 0),
(39, 54, 'qwewq', 'bla bla bla', 'as3', 1395842690, 2147483647, 0),
(40, 66, 'fsaf', '', 'as3', 1395842797, 2147483647, 0),
(41, 66, 'daas', '', 'as3', 1395842817, 2147483647, 0);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `sessions`
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
-- Andmete tõmmistamine tabelile `sessions`
--

INSERT INTO `sessions` (`SessionID`, `UserID`, `IPAddress`, `UserAgent`, `Start`, `End`) VALUES
('I2*Be([fj0({mnJ', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1393968010, 1549488010),
('d/fhGgdvKBJrF98', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394016552, 1549536552),
('gP3jUg49y*FTWA!', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394017573, 1549537573),
('b7Aj/.+}5ZJ/cYa', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394017703, 1549537703),
('5[BPSY0NAQ/AjAs', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394017715, 1549537715),
('iIStHxcf,fD0wa.', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394017717, 1549537717),
('abHxagCk9LE)!AT', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394017723, 1549537723),
('HeJBG9GS5S(qx[&', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394017867, 1549537867),
('jGZGLp+EY$!}L*2', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394017976, 1549537976),
('@G)+lIxsf5rih-f', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018025, 1549538025),
('DFGgKddf/ta}9e.', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018143, 1549538143),
('SQ4%wZHluG&EOGD', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018183, 1549538183),
('x6Q&Sd4JjPHC/Rc', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018200, 1549538200),
('@jh8Dhdls.6H(Kg', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018201, 1549538201),
('jM/!)lfZudFFJ*s', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018208, 1549538208),
('axe,DxWkVjYOeIe', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018239, 1549538239),
('@TXoVxRjJWX/8AF', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018249, 1549538249),
('6R4{4o5xu6.G%+.', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018251, 1549538251),
('w{%X/CHdrA}nGhZ', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018255, 1549538255),
('PPKj5KK$W,0Pgb.', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018381, 1549538381),
('2F/Df}&X$ghSCIr', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018385, 1549538385),
('W/Bl[{{s[hT2smO', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018562, 1549538562),
('meRd2JDfi+SpJ2h', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018566, 1549538566),
('G8Bv(gVHd*%nMTS', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018680, 1549538680),
('H}En$T{HBreKUSs', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018774, 1549538774),
('}GYwU}c8h{tCUip', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394018776, 1549538776),
('bJnS-/Myjb38QcG', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394021282, 1549541282),
('WFY!Bl3DjDs*mGl', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394021323, 1549541323),
('z4wC}iu%APv(M/g', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394026809, 1549546809),
('!@H/A2Hq{yJZ$@&', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394026892, 1549546892),
('!jaN4Q!wS28uLTc', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394026893, 1549546893),
(']nGAmzG+veiFG%A', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394973083, 1550493083),
('PHJDkjHys&f3qj+', 38, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394973090, 1550493090),
('GQ0&DWr3J,I$hAm', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1394973111, 1550493111),
('eUB%+jhtsXSuoiA', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395174914, 1550694914),
(']faSsOjQ4J6Ou1a', 1, '172.17.55.144', '', 1395224794, 1550744794),
('B5B7HDJ.8FFMqJV', 1, '172.17.55.156', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395313129, 1550833129),
('7,MAHj0q!BU3g/R', 1, '193.40.12.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1395313307, 1550833307),
('.W6!!UAfbS{8i]%', 1, '193.40.12.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1395313366, 1550833366),
(']ZNXUfferwHJ1Hd', 1, '193.40.12.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1395313366, 1550833366),
('bFJqHz]PdGnz3HQ', 1, '193.40.12.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1395313650, 1550833650),
('&sCS1HGhgv}T0)Y', 1, '193.40.12.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1395313650, 1550833650),
('-igdp)E/LJH9L{1', 40, '193.40.12.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1395313660, 1550833660),
('JUNEwaYdAF9zhHf', 1, '193.40.12.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1395313677, 1550833677),
('3bKegA+XCOmoShr', 40, '193.40.12.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1395313683, 1550833683),
('{ijgMkgF-L&WhMH', 40, '193.40.12.44', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1395313683, 1550833683),
('gP)a0UeCg5r/0zg', 1, '62.65.62.42', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0', 1395474662, 1550994662),
('z9C2[TBI}a$Sd&]', 1, '193.40.10.180', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', 1395519220, 1551039220),
('0iS)}LUM!VWAVhk', 1, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36', 1395761288, 1551281288),
('-7V{*G+&$J9EjSP', 38, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36', 1395828409, 1551348409),
('Y,9JjAGzR2*f,sc', 1, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395832985, 1551352985),
('Na]kW}u67jS.,$l', 0, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395833014, 1551353014),
('a.eeHs3+RHXpBF8', 0, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395833057, 1551353057),
('aLAVsHxc,vAxQJ[', 0, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395833090, 1551353090),
('%.alMmM71J/$k-R', 0, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395833092, 1551353092),
('*dCIjX7OjAhH8Wl', 0, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395833264, 1551353264),
('T!83Ht%[-RLxhcE', 0, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395833518, 1551353518),
('5(DG-woaLh5H]j$', 1, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395833734, 1551353734),
('&[YvNAV]2A{J9@a', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36', 1395833955, 1551353955),
('6.vi-]JNUs9+h7M', 1, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36', 1395834029, 1551354029),
('vDvL]snaePPfeyd', 0, '172.17.53.50', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395835053, 1551355053),
('UGHJ4&rMG&z-0hu', 0, '172.17.53.50', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395835062, 1551355062),
('qiqfv!H1qFdJJl,', 54, '172.17.53.50', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395835096, 1551355096),
('6H&l@UcSX3aqv*j', 1, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395836042, 1551356042),
('lDaP6)0SCHiHOnW', 54, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395836053, 1551356053),
('(tsDSWdk.E2u{HI', 1, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395836145, 1551356145),
('jln08j,+WPrd}@c', 38, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395836157, 1551356157),
('fZqJ2-FbJ%Pn9Ls', 66, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36', 1395836266, 1551356266),
('GRXPVZ){sJMEJej', 66, '193.40.10.178', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36', 1395836293, 1551356293),
('E4gz9TODlF+L6Sq', 1, '2001:bb8:2002:3', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', 1395840560, 1551360560),
('}[g},!b+Z$hLd($', 1, '128.30.52.103', 'Jigsaw/2.3.0 W3C_CSS_Validator_JFouffa/2.0 (See <http://validator.w3.org/services>)', 1395840858, 1551360858),
('}7O[VO*vhFd(9y}', 1, '128.30.52.103', 'Jigsaw/2.3.0 W3C_CSS_Validator_JFouffa/2.0 (See <http://validator.w3.org/services>)', 1395840898, 1551360898),
('P9ersDhe9fOjmjE', 1, '128.30.52.103', 'Jigsaw/2.3.0 W3C_CSS_Validator_JFouffa/2.0 (See <http://validator.w3.org/services>)', 1395840944, 1551360944),
('V55RCHN7j9Of.ch', 1, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395841540, 1551361540),
('O.cpvd)nAkNGk@M', 54, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395841727, 1551361727),
('*c%Hh2.1RmCQ@2U', 54, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395841761, 1551361761),
('/kDdh+LhGFvK7I!', 1, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395842802, 1551362802),
('sf%08HF.Jx&/XHD', 1, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36', 1395842891, 1551362891),
('xgj,*0}f.4g9CcF', 1, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36', 1395842917, 1551362917),
('xG+%]ZRTXeiYFpD', 38, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395842944, 1551362944),
('S-%GOfvsJBYdGGH', 1, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.154 Safari/537.36', 1395842947, 1551362947),
('hB4Z2t2fb,XwFpq', 1, '2001:bb8:2002:3', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:27.0) Gecko/20100101 Firefox/27.0', 1395842964, 1551362964);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `users`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=67 ;

--
-- Andmete tõmmistamine tabelile `users`
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
(39, 'test', '', 'test', '', 1373302916, 0, 0, 0),
(40, 'stenver', '7694f4a66316e53c8cdd9d9954bd611d', 'q', '', 1395313660, 0, 0, 0),
(54, 'Rain Oksvort', '6adf97f83acf6453d4a6a4b1070f3754', 'ascripting@hotmail.com', '', 1395834723, 0, 0, 0),
(55, 'Rain Oksvort', '6adf97f83acf6453d4a6a4b1070f3754', 'ascripting@hotmail.com', '', 1395834729, 0, 0, 0),
(56, 'Rain Oksvort', '6adf97f83acf6453d4a6a4b1070f3754', 'ascripting@hotmail.com', '', 1395834731, 0, 0, 0),
(57, 'Rain Oksvort', '6adf97f83acf6453d4a6a4b1070f3754', 'ascripting@hotmail.com', '', 1395834836, 0, 0, 0),
(58, 'Rain Oksvort', '6adf97f83acf6453d4a6a4b1070f3754', 'ascripting@hotmail.com', '', 1395834838, 0, 0, 0),
(59, 'Rain Oksvort', '6adf97f83acf6453d4a6a4b1070f3754', 'ascripting@hotmail.com', '', 1395834886, 0, 0, 0),
(60, 'Rain Oksvort', '6adf97f83acf6453d4a6a4b1070f3754', 'ascripting@hotmail.com', '', 1395834889, 0, 0, 0),
(61, 'Rain Oksvort', '6adf97f83acf6453d4a6a4b1070f3754', 'ascripting@hotmail.com', '', 1395834935, 0, 0, 0),
(62, 'Rain Oksvort', '6adf97f83acf6453d4a6a4b1070f3754', 'ascripting@hotmail.com', '', 1395834938, 0, 0, 0),
(63, 'Rain Oksvort', '6adf97f83acf6453d4a6a4b1070f3754', 'ascripting@hotmail.com', '', 1395834965, 0, 0, 0),
(64, 'Rain Oksvort', '6adf97f83acf6453d4a6a4b1070f3754', 'ascripting@hotmail.com', '', 1395834994, 0, 0, 0),
(65, 'Rain Oksvort', '6adf97f83acf6453d4a6a4b1070f3754', 'ascripting@hotmail.com', '', 1395835027, 0, 0, 0),
(66, 'Peeter Robert Reissar', '6adf97f83acf6453d4a6a4b1070f3754', '', '', 1395836266, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `users_fb`
--

DROP TABLE IF EXISTS `users_fb`;
CREATE TABLE IF NOT EXISTS `users_fb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `username` varchar(60) COLLATE utf8_bin NOT NULL,
  `name` varchar(60) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=20 ;

--
-- Andmete tõmmistamine tabelile `users_fb`
--

INSERT INTO `users_fb` (`id`, `uid`, `username`, `name`) VALUES
(7, 54, 'rain.oksvort', 'Rain Oksvort'),
(8, 55, 'rain.oksvort', 'Rain Oksvort'),
(9, 56, 'rain.oksvort', 'Rain Oksvort'),
(10, 57, 'rain.oksvort', 'Rain Oksvort'),
(11, 58, 'rain.oksvort', 'Rain Oksvort'),
(12, 59, 'rain.oksvort', 'Rain Oksvort'),
(13, 60, 'rain.oksvort', 'Rain Oksvort'),
(14, 61, 'rain.oksvort', 'Rain Oksvort'),
(15, 62, 'rain.oksvort', 'Rain Oksvort'),
(16, 63, 'rain.oksvort', 'Rain Oksvort'),
(17, 64, 'rain.oksvort', 'Rain Oksvort'),
(18, 65, 'rain.oksvort', 'Rain Oksvort'),
(19, 66, 'peeter.reissar', 'Peeter Robert Reissar');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
