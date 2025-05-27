unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Math, uDataTypes,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    pcMain: TPageControl;
    tsGuests: TTabSheet;
    lblName: TLabel;

    edGuestName: TEdit;
    lblPref: TLabel;
    lblForbidden: TLabel;
    edForbidden: TEdit;
    btnAddGuest: TButton;
    lbGuests: TListBox;
    tsDishes: TTabSheet;
    lblDishName: TLabel;
    edDishName: TEdit;
    lblCategory: TLabel;
    lblIngredients: TLabel;
    edIngredients: TEdit;
    lblAllergens: TLabel;
    edAllergens: TEdit;
    lblCalories: TLabel;
    edCalories: TEdit;
    lblRating: TLabel;
    edRating: TEdit;
    btnAddDish: TButton;
    lbDishes: TListBox;
    tsMenu: TTabSheet;
    btnGenerateMenu: TButton;
    lbMenu: TListBox;
    tsShopping: TTabSheet;
    btnGenerateList: TButton;
    memoShopping: TMemo;
    btnExcludeDish: TButton;
    btnExportShopping: TButton;
    SaveDialog1: TSaveDialog;
    btnExportMenu: TButton;
    memoDishInfo: TMemo;
    cbCategoryFilter: TComboBox;
    cbCategory: TComboBox;
    btnDeleteGuest: TButton;
    btnSaveGuests: TButton;
    btnLoadGuests: TButton;
    OpenDialog1: TOpenDialog;
    btnDeleteDish: TButton;
    btnSaveDishes: TButton;
    btnLoadDishes: TButton;
    cbDiet: TComboBox;
    cbSort: TComboBox;
    btnSortDishes: TButton;
    cbFilterCategory: TComboBox;
    btnFilterDishes: TButton;
    cbOnlySuitable: TCheckBox;
    cbOnlyPerfectDishes: TCheckBox;
    procedure btnAddGuestClick(Sender: TObject);
    procedure btnAddDishClick(Sender: TObject);
    procedure btnGenerateMenuClick(Sender: TObject);
    procedure btnGenerateListClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExcludeDishClick(Sender: TObject);
    procedure btnExportShoppingClick(Sender: TObject);
    procedure btnExportMenuClick(Sender: TObject);
    procedure lbMenuClick(Sender: TObject);
    procedure btnDeleteGuestClick(Sender: TObject);
    procedure btnSaveGuestsClick(Sender: TObject);
    procedure btnLoadGuestsClick(Sender: TObject);
    procedure btnDeleteDishClick(Sender: TObject);
    procedure btnSaveDishesClick(Sender: TObject);
    procedure btnLoadDishesClick(Sender: TObject);
    procedure btnSortDishesClick(Sender: TObject);
    procedure btnFilterDishesClick(Sender: TObject);
    procedure lbMenuDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure pcMainDrawTab(Control: TCustomTabControl; TabIndex: Integer;
      const Rect: TRect; Active: Boolean);
    procedure lbGuestsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbGuestsMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure lbDishesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbDishesMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure lbMenuMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure cbOnlyPerfectDishesClick(Sender: TObject);


  private
    { Private declarations }
    ExcludedDishes: TStringList;
    GuestList: array of TGuest;
    DishList: array of TDish;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.btnAddDishClick(Sender: TObject);
var
  D: TDish;
  Count: Integer;
  DishStr: string;
begin
  // Проверка обязательных полей
  if edDishName.Text = '' then
  begin
    ShowMessage('Введите название блюда.');
    Exit;
  end;

  D.Name := Trim(edDishName.Text);

  D.Ingredients := Trim(edIngredients.Text);
  D.Allergens := Trim(edAllergens.Text);
  if cbCategory.ItemIndex = -1 then
  begin
    ShowMessage('Выберите категорию блюда.');
    Exit;
  end;
  D.Category := cbCategory.Text;

  // Проверка числовых значений
  if not TryStrToInt(edCalories.Text, D.Calories) then
  begin
    ShowMessage('Введите числовое значение калорийности.');
    Exit;
  end;

  if not TryStrToInt(edRating.Text, D.Rating) then
  begin
    ShowMessage('Введите рейтинг от 1 до 5.');
    Exit;
  end;

  // Добавляем блюдо в массив
  Count := Length(DishList);
  SetLength(DishList, Count + 1);
  DishList[Count] := D;

  // Отображение в списке
  DishStr := '🍽 ' + D.Name + ' (' + D.Category + ')' + sLineBreak +
    '🌿 Ингредиенты: ' + D.Ingredients + sLineBreak + '⚠️ Аллергены: ' +
    D.Allergens + sLineBreak + '🔥 ' + IntToStr(D.Calories) + ' ккал | ⭐ ' +
    IntToStr(D.Rating) + '/5';
  lbDishes.Items.Add(DishStr);

  // Очистка полей
  edDishName.Clear;

  edIngredients.Clear;
  edAllergens.Clear;
  edCalories.Clear;
  edRating.Clear;
end;

procedure TForm1.btnAddGuestClick(Sender: TObject);
var
  G: TGuest;
  Count: Integer;
  GuestStr: string;
begin
  G.Name := Trim(edGuestName.Text);
  G.Diet := cbDiet.Text;
  G.Forbidden := Trim(edForbidden.Text);

  if G.Name = '' then
  begin
    ShowMessage('Введите имя гостя.');
    Exit;
  end;

  Count := Length(GuestList);
  SetLength(GuestList, Count + 1);
  GuestList[Count] := G;

  GuestStr := '👤 ' + G.Name + sLineBreak + '🥗 Диета: ' + G.Diet + sLineBreak +
    '🚫 Запреты: ' + G.Forbidden;
  lbGuests.Items.Add(GuestStr);

  edGuestName.Clear;
  edForbidden.Clear;

end;

procedure TForm1.btnDeleteDishClick(Sender: TObject);
var
  idx, i: Integer;
begin
  idx := lbDishes.ItemIndex;
  if idx = -1 then
  begin
    ShowMessage('Выберите блюдо для удаления.');
    Exit;
  end;

  for i := idx to High(DishList) - 1 do
    DishList[i] := DishList[i + 1];
  SetLength(DishList, Length(DishList) - 1);

  lbDishes.Items.Delete(idx);
end;

procedure TForm1.btnDeleteGuestClick(Sender: TObject);
var
  idx, i: Integer;
begin
  idx := lbGuests.ItemIndex;
  if idx = -1 then
  begin
    ShowMessage('Выберите гостя для удаления.');
    Exit;
  end;

  // Удаляем из массива
  for i := idx to High(GuestList) - 1 do
    GuestList[i] := GuestList[i + 1];
  SetLength(GuestList, Length(GuestList) - 1);

  // Удаляем из списка
  lbGuests.Items.Delete(idx);
end;

procedure TForm1.btnExcludeDishClick(Sender: TObject);
var
  idx: Integer;
  DishLine, DishName: string;
begin
  idx := lbMenu.ItemIndex;
  if idx = -1 then
  begin
    ShowMessage('Выберите блюдо в списке меню.');
    Exit;
  end;

  DishLine := lbMenu.Items[idx];
  DishName := Copy(DishLine, 1, Pos('[', DishLine) - 2); // Название до [
  ExcludedDishes.Add(Trim(DishName));
  lbMenu.Items.Delete(idx);

end;

procedure TForm1.btnExportMenuClick(Sender: TObject);
begin
  if lbMenu.Items.Count = 0 then
  begin
    ShowMessage('Меню пусто. Сначала сгенерируйте его.');
    Exit;
  end;

  SaveDialog1.FileName := 'menu.txt'; // предустановленное имя

  if SaveDialog1.Execute then
  begin
    try
      lbMenu.Items.SaveToFile(SaveDialog1.FileName);
      ShowMessage('Меню успешно сохранено в файл: ' + SaveDialog1.FileName);
    except
      on E: Exception do
        ShowMessage('Ошибка при сохранении: ' + E.Message);
    end;
  end;
end;

procedure TForm1.btnExportShoppingClick(Sender: TObject);
begin
  if memoShopping.Lines.Count = 0 then
  begin
    ShowMessage('Список покупок пуст. Сначала сгенерируйте его.');
    Exit;
  end;

  if SaveDialog1.Execute then
  begin
    try
      memoShopping.Lines.SaveToFile(SaveDialog1.FileName);
      ShowMessage('Список сохранён в файл: ' + SaveDialog1.FileName);
    except
      on E: Exception do
        ShowMessage('Ошибка при сохранении: ' + E.Message);
    end;
  end;
end;

procedure TForm1.btnFilterDishesClick(Sender: TObject);
var
  i: Integer;
  CategoryFilter: string;
begin
  lbDishes.Clear;

  CategoryFilter := LowerCase(cbFilterCategory.Text);

  for i := 0 to High(DishList) do
  begin
    if (CategoryFilter = 'все') or
      (LowerCase(DishList[i].Category) = CategoryFilter) then
    begin
      lbDishes.Items.Add(DishList[i].Name + ' | ' + DishList[i].Category + ' | '
        + IntToStr(DishList[i].Calories) + ' ккал |' +
        IntToStr(DishList[i].Rating) + '  звезд |');
    end;
  end;
end;



  procedure TForm1.btnGenerateListClick(Sender: TObject);
  var
    i, j, k: Integer;
    Dish: TDish;
    Guest: TGuest;
    IngredientList: TArray<string>;
    IItem, Ingredient: string;
    IsForbidden: Boolean;
    DishIsSuitable: Boolean;
  begin
    memoShopping.Clear;

    memoShopping.Lines.Add('🛒 Список покупок по меню:');
    memoShopping.Lines.Add('');

    for i := 0 to High(DishList) do
    begin
      Dish := DishList[i];
      IngredientList := Dish.Ingredients.Split([',']);
      DishIsSuitable := True;

      for j := 0 to High(GuestList) do
      begin
        Guest := GuestList[j];
        IsForbidden := False;

        // Проверка запретов
        if Guest.Forbidden <> '' then
          for var F in Guest.Forbidden.Split([',']) do
            for var Ingr in IngredientList do
              if Trim(LowerCase(F)) = Trim(LowerCase(Ingr)) then
                IsForbidden := True;

        // Проверка диеты
        if not IsForbidden then
        begin
          for k := Low(IngredientList) to High(IngredientList) do
          begin
            IItem := Trim(LowerCase(IngredientList[k]));
            if (Guest.Diet = 'веган') and
              ((IItem = 'мясо') or (IItem = 'молоко') or (IItem = 'яйцо') or
              (IItem = 'сыр')) then
              IsForbidden := True
            else if (Guest.Diet = 'вегетарианец') and
              ((IItem = 'мясо') or (IItem = 'рыба') or (IItem = 'бекон')) then
              IsForbidden := True
            else if (Guest.Diet = 'без глютена') and
              ((IItem = 'мука') or (IItem = 'хлеб') or (IItem = 'пшеница')) then
              IsForbidden := True
            else if (Guest.Diet = 'без лактозы') and
              ((IItem = 'молоко') or (IItem = 'сыр') or (IItem = 'йогурт')) then
              IsForbidden := True;

            if IsForbidden then
              Break;
          end;
        end;

        if IsForbidden then
        begin
          DishIsSuitable := False;
          Break;
        end;
      end;

      // Если блюдо подходит всем — выводим его и ингредиенты
      if (not cbOnlyPerfectDishes.Checked) or DishIsSuitable then
      begin
        memoShopping.Lines.Add('🍽 ' + Dish.Name);
        for Ingredient in IngredientList do
          memoShopping.Lines.Add('• ' + Trim(Ingredient));
        memoShopping.Lines.Add('');
      end;
    end;
  end;

procedure TForm1.btnGenerateMenuClick(Sender: TObject);
var
  i, j, k, UnsuitableCount: Integer;
  Dish: TDish;
  Guest: TGuest;
  ForbiddenItems, IngredientItems: TArray<string>;
  FItem, IItem: string;
  IsForbidden: Boolean;
  MenuLine, GuestsListStr: string;
  IncompatibleGuests: TStringList;
begin
  lbMenu.Clear;

  for i := 0 to Length(DishList) - 1 do
  begin
    Dish := DishList[i];

    // Фильтрация по категории
    if (cbCategoryFilter.Text <> 'все') and
      (LowerCase(Dish.Category) <> LowerCase(cbCategoryFilter.Text)) then
      Continue;

    UnsuitableCount := 0;
    IncompatibleGuests := TStringList.Create;
    try
      IngredientItems := Dish.Ingredients.Split([',']);

      for j := 0 to Length(GuestList) - 1 do
      begin
        Guest := GuestList[j];
        IsForbidden := False;

        // Проверяем запреты
        if Guest.Forbidden <> '' then
        begin
          ForbiddenItems := Guest.Forbidden.Split([',']);
          for FItem in ForbiddenItems do
          begin
            var
            TransformedFItem := Trim(LowerCase(FItem));
            for IItem in IngredientItems do
            begin
              var
              TransformedIItem := Trim(LowerCase(IItem));
              if TransformedFItem = TransformedIItem then
              begin
                IsForbidden := True;
                Break;
              end;
            end;
            if IsForbidden then
              Break;
          end;
        end;

        // Проверяем диету, если ещё не запрещено
        if not IsForbidden then
        begin
          if Guest.Diet = 'веган' then
          begin
            for k := Low(IngredientItems) to High(IngredientItems) do
            begin
              IItem := Trim(LowerCase(IngredientItems[k]));
              if (IItem = 'мясо') or (IItem = 'яйцо') or (IItem = 'молоко') or
                (IItem = 'сыр') or (IItem = 'сливки') or (IItem = 'мёд') then
              begin
                IsForbidden := True;
                Break;
              end;
            end;
          end
          else if Guest.Diet = 'вегетарианец' then
          begin
            for k := Low(IngredientItems) to High(IngredientItems) do
            begin
              IItem := Trim(LowerCase(IngredientItems[k]));
              if (IItem = 'мясо') or (IItem = 'рыба') or (IItem = 'бекон') then
              begin
                IsForbidden := True;
                Break;
              end;
            end;
          end
          else if Guest.Diet = 'без глютена' then
          begin
            for k := Low(IngredientItems) to High(IngredientItems) do
            begin
              IItem := Trim(LowerCase(IngredientItems[k]));
              if (IItem = 'пшеница') or (IItem = 'мука') or (IItem = 'хлеб') or
                (IItem = 'макароны') or (IItem = 'панировка') then
              begin
                IsForbidden := True;
                Break;
              end;
            end;
          end
          else if Guest.Diet = 'без лактозы' then
          begin
            for k := Low(IngredientItems) to High(IngredientItems) do
            begin
              IItem := Trim(LowerCase(IngredientItems[k]));
              if (IItem = 'молоко') or (IItem = 'сыр') or (IItem = 'сливки') or
                (IItem = 'йогурт') then
              begin
                IsForbidden := True;
                Break;
              end;
            end;
          end;
        end;

        if IsForbidden then
        begin
          Inc(UnsuitableCount);
          IncompatibleGuests.Add('✖ ' + Guest.Name);
        end;
      end;

      // Если фильтр "только подходящие" и есть неподходящие — пропускаем
      if cbOnlySuitable.Checked and (UnsuitableCount > 0) then
      begin
        Continue;
      end;

      // Формируем многострочную запись
      MenuLine := '🍽 ' + Dish.Name + ' [' + Dish.Category + ']' + sLineBreak;
      if UnsuitableCount > 0 then
      begin
        GuestsListStr := '🚫 Не подходит:' + sLineBreak +
          IncompatibleGuests.Text;
        MenuLine := MenuLine + GuestsListStr;
      end
      else
      begin
        MenuLine := MenuLine + '✅ Подходит всем гостям' + sLineBreak;
      end;

      if Length(GuestList) > 0 then
      begin
        if UnsuitableCount > Length(GuestList) div 2 then
          MenuLine := MenuLine + '⚠️ Более 50% гостей!';
      end;

      lbMenu.Items.Add(MenuLine);

    finally
      IncompatibleGuests.Free;
    end;
  end;

end;

procedure TForm1.btnLoadDishesClick(Sender: TObject);
var
  SL: TStringList;
  i, idx: Integer;
  D: TDish;
begin
  if not OpenDialog1.Execute then Exit;

  SL := TStringList.Create;
  try
    SL.LoadFromFile(OpenDialog1.FileName);
    SetLength(DishList, 0);
    lbDishes.Clear;

    idx := 0;
    while idx + 5 < SL.Count do
    begin
      D.Name := SL[idx];
      D.Category := SL[idx + 1];
      D.Ingredients := SL[idx + 2];
      D.Allergens := SL[idx + 3];
      D.Calories := StrToIntDef(SL[idx + 4], 0);
      D.Rating := StrToIntDef(SL[idx + 5], 0);

      SetLength(DishList, Length(DishList) + 1);
      DishList[High(DishList)] := D;

      lbDishes.Items.Add('🍽 ' + D.Name + ' (' + D.Category + ')' + sLineBreak +
                         '🌿 Ингредиенты: ' + D.Ingredients + sLineBreak +
                         '⚠️ Аллергены: ' + D.Allergens + sLineBreak +
                         '🔥 ' + IntToStr(D.Calories) + ' ккал | ⭐ ' + IntToStr(D.Rating) + '/5');

      Inc(idx, 7); // Пропуск 6 строк + пустая
    end;

    ShowMessage('✅ Список блюд загружен.');
  finally
    SL.Free;
  end;
end;


procedure TForm1.btnLoadGuestsClick(Sender: TObject);
var
  SL: TStringList;
  i, idx: Integer;
  G: TGuest;
begin
  if not OpenDialog1.Execute then Exit;

  SL := TStringList.Create;
  try
    SL.LoadFromFile(OpenDialog1.FileName);
    SetLength(GuestList, 0);
    lbGuests.Clear;

    idx := 0;
    while idx + 2 < SL.Count do
    begin
      G.Name := SL[idx];
      G.Diet := SL[idx + 1];
      G.Forbidden := SL[idx + 2];

      SetLength(GuestList, Length(GuestList) + 1);
      GuestList[High(GuestList)] := G;

      lbGuests.Items.Add('👤 ' + G.Name + sLineBreak +
                         '🥗 Диета: ' + G.Diet + sLineBreak +
                         '🚫 Запреты: ' + G.Forbidden);

      Inc(idx, 4); // 3 строки + пустая
    end;

    ShowMessage('✅ Список гостей загружен.');
  finally
    SL.Free;
  end;
end;


procedure TForm1.btnSaveDishesClick(Sender: TObject);
var
  SL: TStringList;
  i: Integer;
  D: TDish;
begin
  if Length(DishList) = 0 then
  begin
    ShowMessage('Список блюд пуст.');
    Exit;
  end;

  if SaveDialog1.Execute then
  begin
    SL := TStringList.Create;
    try
      for i := 0 to High(DishList) do
      begin
        D := DishList[i];
        SL.Add(D.Name);
        SL.Add(D.Category);
        SL.Add(D.Ingredients);
        SL.Add(D.Allergens);
        SL.Add(IntToStr(D.Calories));
        SL.Add(IntToStr(D.Rating));
        SL.Add(''); // пустая строка-разделитель
      end;
      SL.SaveToFile(SaveDialog1.FileName);
      ShowMessage('✅ Список блюд сохранён.');
    finally
      SL.Free;
    end;
  end;
end;



procedure TForm1.btnSaveGuestsClick(Sender: TObject);
var
  SL: TStringList;
  i: Integer;
  G: TGuest;
begin
  if Length(GuestList) = 0 then
  begin
    ShowMessage('Список гостей пуст.');
    Exit;
  end;

  if SaveDialog1.Execute then
  begin
    SL := TStringList.Create;
    try
      for i := 0 to High(GuestList) do
      begin
        G := GuestList[i];
        SL.Add(G.Name);
        SL.Add(G.Diet);
        SL.Add(G.Forbidden);
        SL.Add('');
      end;
      SL.SaveToFile(SaveDialog1.FileName);
      ShowMessage('✅ Список гостей сохранён.');
    finally
      SL.Free;
    end;
  end;
end;


procedure TForm1.btnSortDishesClick(Sender: TObject);
var
  i, j: Integer;
  temp: TDish;
begin
  // сортировка пузырьком — для учебных целей достаточно
  for i := 0 to High(DishList) - 1 do
    for j := i + 1 to High(DishList) do
    begin
      case cbSort.ItemIndex of
        0: // калории по возрастанию
          if DishList[i].Calories > DishList[j].Calories then
          begin
            temp := DishList[i];
            DishList[i] := DishList[j];
            DishList[j] := temp;
          end;
        1: // калории по убыванию
          if DishList[i].Calories < DishList[j].Calories then
          begin
            temp := DishList[i];
            DishList[i] := DishList[j];
            DishList[j] := temp;
          end;
        2: // рейтинг по возрастанию
          if DishList[i].Rating > DishList[j].Rating then
          begin
            temp := DishList[i];
            DishList[i] := DishList[j];
            DishList[j] := temp;
          end;
        3: // рейтинг по убыванию
          if DishList[i].Rating < DishList[j].Rating then
          begin
            temp := DishList[i];
            DishList[i] := DishList[j];
            DishList[j] := temp;
          end;
      end;
    end;

  // перерисовка списка
  lbDishes.Clear;
  for i := 0 to High(DishList) do
    lbDishes.Items.Add(DishList[i].Name + ' | ' + DishList[i].Category + ' | ' +
      IntToStr(DishList[i].Calories) + ' ккал |' + IntToStr(DishList[i].Rating)
      + '  звезд |');
end;




procedure TForm1.cbOnlyPerfectDishesClick(Sender: TObject);
begin
  btnGenerateListClick(nil);
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  ExcludedDishes := TStringList.Create;
  if FileExists('guests.txt') then
  begin
    OpenDialog1.FileName := 'guests.txt';
  end;

  if FileExists('dishes.txt') then
  begin
    OpenDialog1.FileName := 'dishes.txt';
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  ExcludedDishes.Free;
  btnSaveGuestsClick(nil);
  btnSaveDishesClick(nil);
end;

procedure DrawMultilineItem(LB: TListBox; Index: Integer; Rect: TRect;
  Canvas: TCanvas);
var
  Txt: string;
begin
  Txt := LB.Items[Index];
  Canvas.FillRect(Rect);
  DrawText(Canvas.Handle, PChar(Txt), Length(Txt), Rect, DT_LEFT or DT_TOP or
    DT_NOPREFIX or DT_WORDBREAK);
end;

procedure TForm1.lbDishesDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  DrawMultilineItem(lbDishes, Index, Rect, lbDishes.Canvas);
end;

procedure TForm1.lbDishesMeasureItem(Control: TWinControl; Index: Integer;
  var Height: Integer);
var
  R: TRect;
  Txt: string;
begin
  R := Rect(0, 0, lbDishes.Width - 10, 0);
  Txt := lbDishes.Items[Index];
  DrawText(lbDishes.Canvas.Handle, PChar(Txt), Length(Txt), R,
    DT_CALCRECT or DT_WORDBREAK);
  Height := R.Bottom - R.Top + 6;
end;

procedure TForm1.lbGuestsDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  Txt: string;
begin
  with (Control as TListBox).Canvas do
  begin
    FillRect(Rect);
    Txt := lbGuests.Items[Index];
    DrawText(Handle, PChar(Txt), Length(Txt), Rect, DT_LEFT or DT_TOP or
      DT_NOPREFIX or DT_WORDBREAK);
  end;
end;

procedure TForm1.lbGuestsMeasureItem(Control: TWinControl; Index: Integer;
  var Height: Integer);
var
  Lines: TStringList;
begin
  Lines := TStringList.Create;
  try
    Lines.Text := lbGuests.Items[Index];
    Height := Max(24, 20 * Lines.Count) + 16;
  finally
    Lines.Free;
  end;
end;

procedure TForm1.lbMenuClick(Sender: TObject);
var
  i: Integer;
  DishName: string;
  Dish: TDish;
begin
  memoDishInfo.Clear;

  if lbMenu.ItemIndex = -1 then
    Exit;

  // Извлекаем название блюда — убираем эмодзи и категорию в скобках
  DishName := Trim(Copy(lbMenu.Items[lbMenu.ItemIndex], 3,
    Pos('[', lbMenu.Items[lbMenu.ItemIndex]) - 4));

  for i := 0 to High(DishList) do
  begin
    if DishList[i].Name = DishName then
    begin
      Dish := DishList[i];
      memoDishInfo.Lines.Add('🌿 Ингредиенты: ' + Dish.Ingredients);
      memoDishInfo.Lines.Add('⚠️ Аллергены: ' + Dish.Allergens);
      memoDishInfo.Lines.Add('🔥 Калорийность: ' + IntToStr(Dish.Calories)
        + ' ккал');
      memoDishInfo.Lines.Add('⭐ Рейтинг: ' + IntToStr(Dish.Rating) + '/5');

      Break;
    end;
  end;
end;

procedure TForm1.lbMenuDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  DrawMultilineItem(lbMenu, Index, Rect, lbMenu.Canvas);
end;

procedure TForm1.lbMenuMeasureItem(Control: TWinControl; Index: Integer;
  var Height: Integer);
var
  R: TRect;
  Txt: string;
begin
  R := Rect(0, 0, lbMenu.Width - 10, 0);
  Txt := lbMenu.Items[Index];
  DrawText(lbMenu.Canvas.Handle, PChar(Txt), Length(Txt), R, DT_CALCRECT or
    DT_WORDBREAK);
  Height := R.Bottom - R.Top + 6;
end;

procedure TForm1.pcMainDrawTab(Control: TCustomTabControl; TabIndex: Integer;
  const Rect: TRect; Active: Boolean);
var
  CaptionText: string;
  R: TRect;
  Canvas: TCanvas;
begin
  Canvas := Control.Canvas;
  CaptionText := pcMain.Pages[TabIndex].Caption;

  R := Rect;
  InflateRect(R, -2, -2);

  if Active then
  begin
    Canvas.Font.Style := [fsBold];
    Canvas.Font.Color := clBlack;
    Canvas.Brush.Color := clWhite;
  end
  else
  begin
    Canvas.Font.Style := [];
    Canvas.Font.Color := clGrayText;
    Canvas.Brush.Color := clBtnFace;
  end;

  Canvas.FillRect(Rect);
  DrawText(Canvas.Handle, PChar(CaptionText), -1, R, DT_CENTER or DT_VCENTER or
    DT_SINGLELINE);
end;

end.
