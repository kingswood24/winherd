unit caQGridDBTableView;

interface

uses
  cxCustomData,
  cxGridRows,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView;

type
  TcaGridDBTableView = class(TcxGridDBTableView)
  private
    FFooterHeight: Integer;
    FGroupFooterHeight: Integer;
  protected
    procedure CreateOptions; override;
    function GetViewInfoClass: TcxCustomGridViewInfoClass; override;
    function GetViewDataClass: TcxCustomGridViewDataClass; override;    // Get the row class

  published
    property FooterHeight: Integer read FFooterHeight write FFooterHeight default -1;
    property GroupFooterHeight: Integer read FGroupFooterHeight write FGroupFooterHeight default -1;
  end;

  // Main footer event chain
  //////////////////////////////////////////////////////////////////////////////

  TcaGridTableViewInfo = class(TcxGridTableViewInfo)
  protected
    // Called by GetViewInfoClass
    function GetFooterViewInfoClass: TcxGridFooterViewInfoClass; override;
  end;

  TcaGridFooterViewInfo = class(TcxGridFooterViewInfo)
  protected
    function GetItemHeight(AIndex: Integer): Integer; override;
//    function GetItemClass: TcxGridColumnHeaderViewInfoClass;
    function CalculateHeight: Integer; override;
  end;

  TcaGridFooterCellViewInfo = class(TcxGridFooterCellViewInfo)
  protected

  end;

  // Group footer event chain
  //////////////////////////////////////////////////////////////////////////////

  TcaGridViewData = class(TcxCustomGridTableViewData)
  protected
    // Called by GetViewDataClass
    function GetRecordClass(ARecordInfo: TcxRowInfo): TcxCustomGridRecordClass; override;
  end;

// group rows

  TcaGridGroupRow = class(TcxGridGroupRow)
  protected
    //Called by GetRecordClass
    function GetViewInfoClass: TcxCustomGridRecordViewInfoClass; override;
  end;

  TcaGridGroupRowViewInfo = class(TcxGridGroupRowViewInfo)
  protected
    // Called by GetViewInfoClass
    function GetFootersViewInfoClass: TcxGridRowFootersViewInfoClass; override;
  end;

  TcaGridRowFootersViewInfo = class(TcxGridRowFootersViewInfo)
  protected
    // Called by GetFootersViewInfoClass
    function GetItemClass: TcxGridRowFooterViewInfoClass; override;
  end;

  TcaGridRowFooterViewInfo = class(TcxGridRowFooterViewInfo)
  protected
    function CalculateHeight: Integer; override;
    function GetItemHeight(AIndex: Integer): Integer; override;
  end;

// data rows

  TcaGridDataRow = class(TcxGridDataRow)
  protected
    //Called by GetRecordClass
    function GetViewInfoClass: TcxCustomGridRecordViewInfoClass; override;
  end;

  TcaGridDataRowViewInfo = class(TcxGridDataRowViewInfo)
  protected
    // Called by GetViewInfoClass
    function GetFootersViewInfoClass: TcxGridRowFootersViewInfoClass; override;
  end;



implementation

procedure TcaGridDBTableView.CreateOptions;
begin
  inherited;
  FFooterHeight := -1;
  FGroupFooterHeight := -1;

  // Add other options here

end;

function TcaGridDBTableView.GetViewInfoClass: TcxCustomGridViewInfoClass;
begin
  Result := TcaGridTableViewInfo;
end;

function TcaGridTableViewInfo.GetFooterViewInfoClass: TcxGridFooterViewInfoClass;
begin
  Result := TcaGridFooterViewInfo;
end;

function TcaGridFooterViewInfo.CalculateHeight: Integer;
begin
  with GridView as TcaGridDBTableView do
    if FooterHeight > -1 then
      Result := FooterHeight
    else
      Result := inherited CalculateHeight;
end;

function TcaGridDBTableView.GetViewDataClass: TcxCustomGridViewDataClass;
begin
  Result := TcaGridViewData;
end;

{ TcaGridViewData }

function TcaGridViewData.GetRecordClass(ARecordInfo: TcxRowInfo): TcxCustomGridRecordClass;
begin
  if ARecordInfo.Level < DataController.Groups.GroupingItemCount then
    Result := TcaGridGroupRow     // CA override    //if TcxGridGroupRow everything works ok
  else
    if GridView.IsMaster then
      Result := TcxGridMasterDataRow
    else
      Result := TcaGridDataRow;
end;

{ TcxGridGroupRow }

function TcaGridGroupRow.GetViewInfoClass: TcxCustomGridRecordViewInfoClass;
begin
  // broken by this event
   Result := TcaGridGroupRowViewInfo;
end;

{ TcaGridGroupRowViewInfo }

function TcaGridGroupRowViewInfo.GetFootersViewInfoClass: TcxGridRowFootersViewInfoClass;
begin
  Result := TcaGridRowFootersViewInfo;
end;

{TcaGridRowFootersViewInfo}

function TcaGridRowFootersViewInfo.GetItemClass: TcxGridRowFooterViewInfoClass;
begin
  Result := TcaGridRowFooterViewInfo;
end;

{ TcaGridRowFooterViewInfo }

function TcaGridRowFooterViewInfo.CalculateHeight: Integer;
begin
  with GridViewInfo.GridView as TcaGridDBTableView do
    if GroupFooterHeight > -1 then
      Result := GroupFooterHeight
    else
      Result := inherited CalculateHeight;
//b  Height := Result;
end;

function TcaGridDataRow.GetViewInfoClass: TcxCustomGridRecordViewInfoClass;
begin
  Result := TcaGridDataRowViewInfo;
end;

function TcaGridRowFooterViewInfo.GetItemHeight(AIndex: Integer): Integer;
begin
  Result := CalculateHeight;
end;

{ TcaGridDataRowViewInfo }

function TcaGridDataRowViewInfo.GetFootersViewInfoClass: TcxGridRowFootersViewInfoClass;
begin
  Result := TcaGridRowFootersViewInfo;;
end;

// initialization and finalization only required to all the views to show on the forms at design time
{ TcaGridDataRow }
function TcaGridFooterViewInfo.GetItemHeight(AIndex: Integer): Integer;
begin
  Result := CalculateHeight;
end;

initialization
  cxGridRegisteredViews.Register(TcaGridDBTableView, 'CA DB Table View');

finalization
  cxGridRegisteredViews.Unregister(TcaGridDBTableView);

end.

