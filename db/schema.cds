namespace com.logali;

type Name : String(50);

type Address { //Tipo Personalizado Estructurado en este caso lo uso para la Entity Suppliers_01
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
};

// type EmailAddresses_01 : array of {
//     kind  : String;
//     email : String;
// }; //Tipo Matriz

// type EmailAddresses_02 {
//     kind  : String;
//     email : String;
// }; //Tipo Estructurado para convertirlo en matriz despues

// entity Emails {
//     email_01 : EmailAddresses_01; //Primera forma de definir tipo matriz
//     email_02 : many EmailAddresses_02; //Segunda forma de definir tipo matriz
//     email_03 : many {
//         kind  : String;
//         email : String;
//     } //Tercera forma de definir tipo matriz
// };

// type Gender : String enum {
//     male;
//     female;
// }; //Enumeracion tienen el proposito de determinar que posibles valores se le puede asignar a una columna que usa un tipo enum

// entity Order {
//     clientGender : Gender;
//     status       : Integer enum {
//         submitted = 1;
//         fullfiler = 2;
//         shipped = 3;
//         cancel = -1;
//     };
//     priority     : String @assert.range enum {
//         high;
//         medim;
//         low;
//     };
// };

type Dec  : Decimal(16, 2); //Tipo por referencia

entity Products {
    key ID               : UUID;
        Name             : String not null; //Restriccion campo no nulo 
        Description      : String;
        ImageUrl         : String;
        ReleaseDate      : DateTime default $now; //Valor predeterminado datetime del momento
        DiscontinuedDate : DateTime;
        Price            : Decimal(16, 2); //Decimal con 16 caracteres y dos decimales
        Height           : type of Price; //Decimal(16, 2);
        Width            : Dec; //Tipo por referencia Dec linea 32 //Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
};

entity Suppliers {
    key ID         : UUID;
        Name       : type of Products : Name; //Tipo por referencia columna Name de products linea 36//String;
        Street     : String;
        City       : String;
        State      : String(2);
        PostalCode : String(5);
        Country    : String(3);
        Email      : String;
        Phonne     : String;
        Fax        : String;
};

entity Suppliers_01 {
    key ID      : UUID;
        Name    : String;
        Address : Address;
        Email   : String;
        Phonne  : String;
        Fax     : String;
};

entity Categories {
    key ID   : String(1);
        Name : String;
};

entity StockAvailability {
    key ID          : Integer;
        Description : String;
};

entity Currencies {
    key ID          : String(3);
        Description : String;
};

entity UnitOfMeasures {
    key ID          : String(2);
        Description : String;
};

entity DimensionUnits {
    key ID          : String(2);
        Description : String;
};

entity Months {
    key ID               : String(2);
        Description      : String;
        ShortDescription : String(3);
};

entity ProductReviews {
    key Name    : String;
        Rating  : Integer;
        Comment : String;
};

entity SalesData {
    key ID           : UUID;
    key DeliveryDate : DateTime;
        Revenue      : Decimal(16, 2);
}
