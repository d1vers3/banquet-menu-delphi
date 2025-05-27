unit uDataTypes;

interface

type
  TGuest = record
    Name: string;
    Forbidden: string;
    Diet: string;
  end;

  TDish = record
    Name: string;
    Category: string;
    Ingredients: string;
    Allergens: string;
    Calories: Integer;
    Rating: Integer;
  end;

  TMenuItem = record
    Dish: TDish;
    NotSuitableCount: Integer;
  end;

implementation

end.

