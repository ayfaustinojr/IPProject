function varargout = MP_Gui(varargin)
% MP_GUI MATLAB code for MP_Gui.fig
%      MP_GUI, by itself, creates a new MP_GUI or raises the existing
%      singleton*.
%
%      H = MP_GUI returns the handle to a new MP_GUI or the handle to
%      the existing singleton*.
%
%      MP_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MP_GUI.M with the given input arguments.
%
%      MP_GUI('Property','Value',...) creates a new MP_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MP_Gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MP_Gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MP_Gui

% Last Modified by GUIDE v2.5 22-Sep-2017 21:17:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MP_Gui_OpeningFcn, ...
                   'gui_OutputFcn',  @MP_Gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before MP_Gui is made visible.
function MP_Gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MP_Gui (see VARARGIN)

% Choose default command line output for MP_Gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MP_Gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MP_Gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loadImage.
function loadImage_Callback(hObject, eventdata, handles)
% hObject    handle to loadImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fn pn]= uigetfile({'*.jpg; *.jpeg; *.png; *.bmp;'},'Select Image');
if isequal(fn,0)
    disp('User selected Cancel');
else 
    disp(['User selected ', fullfile(pn,fn)]);
end
imageSelect = imread(strcat(pn,fn));
assignin('caller','image',imageSelect);
imshow(imageSelect,'Parent',handles.axes1);


% --- Executes on button press in flipImage.
function flipImage_Callback(hObject, eventdata, handles)
% hObject    handle to flipImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in saveImage.
function saveImage_Callback(hObject, eventdata, handles)
% hObject    handle to saveImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% myFolder = pwd;
% fullFile = fullfile(myFolder,'saved.jpg');
% imwrite(image,fullFile);

% --- Executes on button press in cropImage.
function cropImage_Callback(hObject, eventdata, handles)
% hObject    handle to cropImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function brightness_Callback(hObject, eventdata, handles)
% hObject    handle to brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
h=floor(get(hObject,'Value'))
imshow(uint8(image1),'Parent',handles.axes1);

% --- Executes during object creation, after setting all properties.
function brightness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
