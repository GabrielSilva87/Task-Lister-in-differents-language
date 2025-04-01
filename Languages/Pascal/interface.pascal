unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  { TForm1 }
  TForm1 = class(TForm)
    ButtonAdd: TButton;
    ButtonRemove: TButton;
    EditTask: TEdit;
    ListBoxTasks: TListBox;
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonRemoveClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ButtonAddClick(Sender: TObject);
begin
  if EditTask.Text <> '' then
  begin
    ListBoxTasks.Items.Add(EditTask.Text);
    EditTask.Clear;
  end;
end;

procedure TForm1.ButtonRemoveClick(Sender: TObject);
begin
  if ListBoxTasks.ItemIndex <> -1 then
  begin
    ListBoxTasks.Items.Delete(ListBoxTasks.ItemIndex);
  end;
end;

end.