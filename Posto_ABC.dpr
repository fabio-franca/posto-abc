program Posto_ABC;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form_principal},
  Unit_abastecimento in 'Unit_abastecimento.pas' {Form_abastecimento},
  Unit_relatorio in 'Unit_relatorio.pas' {Form_rel_abastecimento};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm_principal, Form_principal);
  Application.CreateForm(TForm_abastecimento, Form_abastecimento);
  Application.CreateForm(TForm_rel_abastecimento, Form_rel_abastecimento);
  Application.Run;
end.
