unit uEventDataTransfer;

interface

type
  TEventDataTransfer = class
  private
    FOldID: Integer;
    FNewID: Integer;
  public
    property OldID : Integer read FOldID write FOldID;
    property NewID : Integer read FNewID write FNewID;
  end;

implementation

end.
