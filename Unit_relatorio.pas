unit Unit_relatorio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpCon, RpConDS, RpDefine, RpRave, DB, ADODB, StdCtrls, Buttons,
  ComCtrls;

type
  TForm_rel_abastecimento = class(TForm)
    btn_gerar: TBitBtn;
    ADOQuery_rel_abastecimento: TADOQuery;
    ADOQuery_aux: TADOQuery;
    rel_abastecimento: TRvProject;
    ds_rel_abastecimento: TRvDataSetConnection;
    dt_inicial: TDateTimePicker;
    dt_final: TDateTimePicker;
    Label2: TLabel;
    btn_sair: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btn_gerarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    data_inicial, data_final: string;
  end;

var
  Form_rel_abastecimento: TForm_rel_abastecimento;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm_rel_abastecimento.FormShow(Sender: TObject);
begin
  dt_inicial.Date := Date;
  dt_final.Date := Date;
end;

procedure TForm_rel_abastecimento.btn_gerarClick(Sender: TObject);
var sql: string;
begin
  data_inicial := FormatDateTime('mm/dd/yyyy',dt_inicial.Date);
  data_final := FormatDateTime('mm/dd/yyyy',dt_final.Date);

    sql:= ' SELECT CONVERT(varchar(10), AB.DATA_ABASTECIMENTO, 103) AS DATA,  '+
          '     TA.ID_TANQUE, TA.COMBUSTIVEL, BO.DESCRICAO AS BOMBA,  '+
          '     AB.VALOR FROM BOMBAS BO '+
          ' INNER JOIN TANQUES TA '+
          '     ON TA.ID_TANQUE = BO.ID_TANQUE '+
          ' INNER JOIN ABASTECIMENTO AB '+
          ' ON AB.ID_BOMBA_ABASTECIMENTO = BO.ID_BOMBA '+
          ' WHERE AB.DATA_ABASTECIMENTO BETWEEN ' + QuotedStr(data_inicial) + ' AND ' + QuotedStr(data_final)+
          ' ORDER BY AB.DATA_ABASTECIMENTO';

    ADOQuery_rel_abastecimento.SQL.Text := sql;
    ADOQuery_rel_abastecimento.Open;
    rel_abastecimento.ProjectFile := GetCurrentDir + '\rel_abastecimento.rav';
    rel_abastecimento.Execute;
    ADOQuery_rel_abastecimento.Close;
end;

procedure TForm_rel_abastecimento.FormCreate(Sender: TObject);
begin
  dt_inicial.Date := Date;
  dt_final.Date := Date;
end;

procedure TForm_rel_abastecimento.btn_sairClick(Sender: TObject);
begin
 Close;
end;

end.
