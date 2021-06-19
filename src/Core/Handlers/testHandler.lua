print("im a test handler")

local Enum = require("Enum")

local enum = Enum.new(
    "testEnum",
    {
        "option1",
        "option2",
        "option3",
    }
)

print(Enum)
print(Enum.testEnum)
print(Enum.testEnum.option1)
print(enum)
print(enum.option1)
print(enum.option1 == enum.option1)
print(enum.option1 ~= enum.option1)