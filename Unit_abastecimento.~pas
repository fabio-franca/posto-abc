unit Unit_abastecimento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ComCtrls, ExtCtrls, DB, ADODB;

type
  TForm_abastecimento = class(TForm)
    cb_bomba: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    btn_fechar: TBitBtn;
    edt_litro: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    dt_abastecimento: TDateTimePicker;
    ADOQuery_aux: TADOQuery;
    Bevel1: TBevel;
    btn_salvar: TBitBtn;
    edt_valor: TEdit;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_bombaChange(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    id_bomba: string;
  end;

var
  Form_abastecimento: TForm_abastecimento;
  num_bomba: integer;
  deu_erro: boolean;
implementation

uses Unit1;

{$R *.dfm}

procedure TForm_abastecimento.btn_fecharClick(Sender: TObject);
begin
 Close;
end;


procedure TForm_abastecimento.FormShow(Sender: TObject);
begin
   edt_valor.Text := '';
   cb_bomba.Clear;
   dt_abastecimento.Date := Date;

   //Monta o select do combo bomba
   ADOQuery_aux.SQL.Text := ' SELECT DESCRICAO FROM BOMBAS ORDER BY DESCRICAO ';

   ADOQuery_aux.Open;

   //Enquanto não chegar no final da query faça
    while not ADOQuery_aux.Eof do
      begin
       //Adiciona ao combobox o nome da bomba do registro corrente
       cb_bomba.Items.Add(ADOQuery_aux.fieldbyname('DESCRICAO').AsString);
       //Passa para o próximo registro da query
       ADOQuery_aux.Next;
      end;

  ADOQuery_aux.Close;
end;

procedure TForm_abastecimento.cb_bombaChange(Sender: TObject);
begin
  ADOQuery_aux.SQL.Text:='SELECT ID_BOMBA FROM BOMBAS '+
                          'WHERE DESCRICAO = '+ QuotedStr(cb_bomba.Text);
  //Abre a query
  adoquery_aux.Open;
  //Atribui o valor obtido à variável
  num_bomba := ADOQuery_aux.fieldbyname('ID_BOMBA').AsInteger;
  //Fecha a query
  ADOQuery_aux.Close;
end;

procedure TForm_abastecimento.btn_salvarClick(Sender: TObject);
var data_abastecimento: string;
    valor, percentual, valorFinal: real;
begin
   valor := StrToFloat(edt_valor.Text);
   percentual := (13/100);
   valorFinal := valor + (percentual * valor);
   edt_valor.Text := FormatFloat('#,##0.00', valorFinal);
   edt_valor.Text := StringReplace(edt_valor.Text, ',', '.', [rfReplaceAll, rfIgnoreCase]);


  if(trim(cb_bomba.Text)='') or (trim(edt_litro.Text)='')
          or (trim(edt_valor.Text)='') then
    begin
      Showmessage('Todos os campos são obrigatórios!')
    end
  else
    begin
      Form_principal.ConexaoBD.BeginTrans;
      data_abastecimento := FormatDateTime('mm/dd/yyyy',dt_abastecimento.Date);
      ADOQuery_aux.SQL.Text := ' INSERT INTO ABASTECIMENTO (ID_BOMBA_ABASTECIMENTO, LITROS, VALOR, DATA_ABASTECIMENTO) VALUES ' +
                               ' ( ' + IntToStr(num_bomba) +
                               ' , '+ QuotedStr(edt_litro.Text)+ ' , ' + QuotedStr(edt_valor.Text) +
                               ' , ' + QuotedStr(data_abastecimento)+ ')';
      try
        //Executa o comando SQL
        ADOQuery_aux.ExecSQL;
        deu_erro := false;
      except
        on E: Exception do
        begin
          deu_erro:= true;
          Showmessage('Ocorreu o seguinte erro: ' + E.Message);
        end;
      end;

      if deu_erro = false then
        begin
          Form_principal.ConexaoBD.CommitTrans;

          Showmessage('Registro salvo com sucesso!');
          cb_bomba.ItemIndex:= -1;
          edt_litro.Clear;
          edt_valor.Clear;
          dt_abastecimento.Date := Date;
        end
      else
        begin
          Form_principal.ConexaoBD.RollbackTrans;
        end;
    end
end;

end.
