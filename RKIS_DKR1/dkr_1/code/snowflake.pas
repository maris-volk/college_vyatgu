uses
  GraphABC, KochSnowflakeUnit;

var
  x_pos1, y_pos1, x_pos2, y_pos2, x_pos3, y_pos3, scale: Real;
  depth: Integer;

procedure KeyDown(Key: Integer);
begin
  case Key of
    VK_Left: x_pos1 := x_pos1 - 10;
    VK_Right: x_pos1 := x_pos1 + 10;
    VK_Up: y_pos1 := y_pos1 - 10;
    VK_Down: y_pos1 := y_pos1 + 10;
    189: if scale > 10 then scale := scale - 10;
    187: scale := scale + 10;
  end;
  UpdateCoords(x_pos1, y_pos1, scale, x_pos2, y_pos2, x_pos3, y_pos3); // Обновление координат
  DrawSnowflake(x_pos1, y_pos1, x_pos2, y_pos2, x_pos3, y_pos3, scale, depth); // Перерисовка снежинки
end;

begin
  SetWindowSize(500,500);
  SetWindowCaption('Снежинка Коха');
  scale := 400;
  x_pos1 := 100;
  y_pos1 := 354;
  depth := 5; 

  UpdateCoords(x_pos1, y_pos1, scale, x_pos2, y_pos2, x_pos3, y_pos3);
  DrawSnowflake(x_pos1, y_pos1, x_pos2, y_pos2, x_pos3, y_pos3, scale, depth);
  OnKeyDown := KeyDown;
end.
