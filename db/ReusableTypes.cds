namespace reusable.types;


/**
 * Types will make the reusable component to use them in the
 * entity And the Assert.format will make the regx to validate
 * the respective config. Here we have used the regx for email
 * and phone to validate them before creation or insertion.
 */
type PhoneNumber : String @assert.format: '^([+]\d{2})?\d{10}$';
type Email       : String @assert.format: '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

type Gender      : String enum {
    Male;
    Female;
    Others
};

type Amount      : Decimal(10, 2);
