unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, DB, ADODB;

type
  TForm_principal = class(TForm)
    btn_abastecer: TBitBtn;
    btn_relatorio: TBitBtn;
    btn_fechar: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
    ConexaoBD: TADOConnection;
    ADOQuery_aux: TADOQuery;
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_abastecerClick(Sender: TObject);
    procedure btn_relatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_principal: TForm_principal;

implementation

uses Unit_abastecimento, Unit_relatorio;

{$R *.dfm}

procedure TForm_principal.btn_fecharClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_principal.btn_abastecerClick(Sender: TObject);
begin
  Form_abastecimento.showmodal;
end;

procedure TForm_principal.btn_relatorioClick(Sender: TObject);
begin
  Form_rel_abastecimento.showmodal;
end;

end.
