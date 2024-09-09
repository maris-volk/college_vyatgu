unit KochSnowflakeUnit;

interface

uses GraphABC;

procedure DrawSnowflake(x_pos1, y_pos1, x_pos2, y_pos2, x_pos3, y_pos3, scale: Real; depth: Integer);
procedure UpdateCoords(var x_pos1, y_pos1: Real; scale: Real; var x_pos2, y_pos2, x_pos3, y_pos3: Real);

implementation

procedure Draw(x, y, length, grad: Real; t: Integer); forward;

procedure Draw2(var x, y: Real; length, grad: Real; depth: Integer); forward;

procedure Draw(x, y, length, grad: Real; t: Integer);
begin
  if t > 0 then
  begin
    length := length / 3;
    Draw2(x, y, length, grad, t-1);
    Draw2(x, y, length, grad + Pi / 3, t-1);
    Draw2(x, y, length, grad - Pi / 3, t-1);
    Draw2(x, y, length, grad, t-1);
  end
  else
    Line(Round(x), Round(y), Round(x + Cos(grad) * length), Round(y - Sin(grad) * length));
end;

procedure Draw2(var x, y: Real; length, grad: Real; depth: Integer);
begin
  Draw(x, y, length, grad, depth);
  x := x + length * Cos(grad);
  y := y - length * Sin(grad);
end;

procedure UpdateCoords(var x_pos1, y_pos1: Real; scale: Real; var x_pos2, y_pos2, x_pos3, y_pos3: Real);
var
  katet: Real;
begin
  x_pos2 := x_pos1 + scale;
  katet := scale / 2;
  x_pos3 := x_pos1 + katet;
  y_pos2 := y_pos1;
  y_pos3 := y_pos1 - katet * Power(3, 1/2);
end;

procedure DrawSnowflake(x_pos1, y_pos1, x_pos2, y_pos2, x_pos3, y_pos3, scale: Real; depth: Integer);
begin
  LockDrawing;
  ClearWindow;
  Draw(x_pos1, y_pos1, scale, pi/3, depth);
  Draw(x_pos2, y_pos2, scale, pi, depth);
  Draw(x_pos3, y_pos3, scale, -pi/3, depth);
  Redraw;
end;

end.

