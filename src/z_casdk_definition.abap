*--------------------------------------------------------------*
*  CAOTIC ABAP Software Development Kit (CASDK) - Definition   *
*--------------------------------------------------------------*
* Author: Camilo A. Ospina A.                                  *
* Version: 1.0.0                                               *
* Original Source Code: https://github.com/caotic-co/CASDK     *
*--------------------------------------------------------------*
* NOTE:                                                        *
* Do no forget to set z_casdk_syntax_check as the main         *
* program for z_casdk_definition and z_casdk_implementation    *
* when activating the includes, so that the appropriate        *
* syntax checks can be done.                                   *
*--------------------------------------------------------------*
*                        MIT License                           *
*                                                              *
*                    Copyright (c) CAOTIC                      *
*                                                              *
* Permission is hereby granted, free of charge, to any person  *
* obtaining a copy of this software and associated             *
* documentation files (the "Software"), to deal in the         *
* Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, *
* sublicense, and/or sell copies of the Software, and to       *
* permit persons to whom the Software is furnished to do so,   *
* subject to the following conditions:                         *
*                                                              *
* The above copyright notice and this permission notice shall  *
* be included in all copies or substantial portions of the     *
* Software.                                                    *
*                                                              *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY    *
* KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE   *
* WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR      *
* PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS   *
* OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR     *
* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR   *
* OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE    *
* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.       *
*--------------------------------------------------------------*

*--------------------------------------------------------------*
* CASDK RAW TYPES                                              *
*--------------------------------------------------------------*

types:
    casdk_raw_boolean              type c length 1,
    casdk_raw_string               type string,
    casdk_raw_integer              type i,
    casdk_raw_float                type p length 16 decimals 14,
    casdk_raw_long                 type p length 16 decimals 0,
    casdk_raw_byte                 type x length 4,
    casdk_raw_byte_string          type xstring,
    casdk_raw_date                 type d,
    casdk_raw_time                 type t,
    casdk_raw_exception_message    type c length 50.


*--------------------------------------------------------------*
* CASDK CONSTANTS                                              *
*--------------------------------------------------------------*

constants:
    casdk_version type casdk_raw_string value '1.0.0',
    casdk_empty   type casdk_raw_string  value '',
    casdk_space   type casdk_raw_string  value ' ',
    casdk_true    type casdk_raw_boolean value 'X',
    casdk_false   type casdk_raw_boolean value ' '.


*--------------------------------------------------------------*
* EXCEPTIONS                                                   *
*--------------------------------------------------------------*

"! Base exception for all CASDK static exceptions
class casdk_exception definition create public inheriting from cx_static_check.
    public section.
        interfaces if_t100_dyn_msg.

        "! Initializes the exception
        "! @parameter msgv1    | First message line of the exceptions's reason
        "! @parameter msgv2    | Second message line of the exceptions's reason
        "! @parameter msgv3    | Third message line of the exceptions's reason
        "! @parameter msgv4    | Fourth message line of the exceptions's reason
        methods constructor
            importing value(msgv1) type casdk_raw_exception_message optional
                      value(msgv2) type casdk_raw_exception_message optional
                      value(msgv3) type casdk_raw_exception_message optional
                      value(msgv4) type casdk_raw_exception_message optional.

        "! Returns the full message associated to the exception
        methods get_message
            returning value(result) type casdk_raw_string.

        "! Raises a new exception with the current messages
        methods raise_exception
            raising casdk_exception.

        "! Returns a quoted representation of a string.
        "! @parameter text    | Raw string to be quoted.
        class-methods generate_exception_message
            importing value(text) type casdk_raw_string
            returning value(quoted_text) type casdk_raw_exception_message.
endclass.
*--------------------------------------------------------------*

"! Base exception for all CASDK runtime exceptions
class casdk_runtime_exception definition create public inheriting from cx_dynamic_check.
    public section.
        interfaces if_t100_dyn_msg.

        "! Initializes the exception
        "! @parameter msgv1    | First message line of the exceptions's reason
        "! @parameter msgv2    | Second message line of the exceptions's reason
        "! @parameter msgv3    | Third message line of the exceptions's reason
        "! @parameter msgv4    | Fourth message line of the exceptions's reason
        methods constructor
            importing value(msgv1) type casdk_raw_exception_message optional
                      value(msgv2) type casdk_raw_exception_message optional
                      value(msgv3) type casdk_raw_exception_message optional
                      value(msgv4) type casdk_raw_exception_message optional.

        "! Returns the full message associated to the exception
        methods get_message
            returning value(result) type casdk_raw_string.

        "! Raises a new exception with the current messages
        methods raise_exception
            raising casdk_runtime_exception.
endclass.
*--------------------------------------------------------------*

"! Raised when the reference to an object is not initialized
class casdk_nullpointer_exception definition create public inheriting from casdk_runtime_exception.
    public section.
        methods raise_exception redefinition.
endclass.
*--------------------------------------------------------------*

"! Raised when a cast fails to be performed
class casdk_cast_exception definition create public inheriting from casdk_runtime_exception.
    public section.
        methods raise_exception redefinition.
endclass.
*--------------------------------------------------------------*

"! Raised when an invalid type is used
class casdk_invalid_type_exception definition create public inheriting from casdk_runtime_exception.
    public section.
        methods raise_exception redefinition.
endclass.
*--------------------------------------------------------------*

"! Raised when an overflow has presented
class casdk_overflow_exception definition create public inheriting from casdk_runtime_exception.
    public section.
        methods raise_exception redefinition.
endclass.
*--------------------------------------------------------------*

"! Raised when an index is bigger that the supported range
class casdk_index_out_of_bounds_ex definition create public inheriting from casdk_runtime_exception.
    public section.
        methods raise_exception redefinition.
endclass.
*--------------------------------------------------------------*


*--------------------------------------------------------------*
* CLASSES                                                      *
*--------------------------------------------------------------*

"! Base class for all CASDK objects
class casdk_object definition.
    public section.
        "! Initializes the object values.
        methods constructor.

        "! Returns the class_name of the current object
        "! @parameter result    | Retrieved class name
        methods class_name
            returning value(result) type casdk_raw_string.

        "! Generates a hash code that can be used as index in hash data structures.
        "! @parameter result    | Generated hash code
        methods hash_code
            returning value(result) type casdk_raw_string.

        "! Compares if the current object is equal to another casdk_object
        "! @parameter obj      | Object to compare against
        "! @parameter result   | Result bool flag of the comparison
        methods equals
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Returns the representation of the object as a string
        "! @parameter result    | Generated string representation
        methods to_string
            returning value(result) type casdk_raw_string.

        "! Evaluates if a given object or variable is a casdk_object type
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_object
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

    private section.
        types:
            begin of class_info,
                class_name   type casdk_raw_string,
                object_count type casdk_raw_long,
             end of class_info.
        class-data attr_objects_info type hashed table of class_info with unique key class_name.
        data attr_hash_code type casdk_raw_long value 0.
endclass.
*--------------------------------------------------------------*

"! Immutable Boolean wrapper for raw boolean values
class casdk_boolean definition create private inheriting from casdk_object.
    public section.
        "! Initializes the object value.
        "! @parameter bool    | Raw boolean value to be assigned
        methods constructor
            importing value(bool) type casdk_raw_boolean.

        "! Returns the current raw boolean value of the object
        methods get_value
            returning value(result) type casdk_raw_boolean.

        methods hash_code redefinition.
        methods equals redefinition.
        methods to_string redefinition.

        "! Evaluates if a given object or variable has a valid raw boolean value
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_a_valid_raw_value
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a boolean object
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_boolean_object
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Factory that creates a new Boolean object with a true value
        class-methods true
            returning value(result) type ref to casdk_boolean.

        "! Factory that creates a new Boolean object with a false value
        class-methods false
            returning value(result) type ref to casdk_boolean.

        "! Factory that creates a new Boolean object based on a raw boolean value.
        "! If a casdk_object is given it will try to cast it.
        "! @parameter obj    | Raw boolean value to be assigned or casdk_object to be casted
        class-methods value_of
            importing value(obj) type any
            returning value(result) type ref to casdk_boolean
            raising casdk_nullpointer_exception
                    casdk_cast_exception.

        "! Logical 'NOT' operation between Boolean objects
        "! @parameter boolean    | Input to be negated
        class-methods logical_not
            importing value(boolean) type any
            returning value(result) type casdk_raw_boolean.

        "! Logical 'AND' operation between Boolean objects
        "! @parameter a    | Left predicate element of the operation
        "! @parameter b    | Right predicate element of the operation
        class-methods logical_and
            importing value(a) type any
                      value(b) type any
            returning value(result) type casdk_raw_boolean.

        "! Logical 'OR' operation between Boolean objects
        "! @parameter a    | Left predicate element of the operation
        "! @parameter b    | Right predicate element of the operation
        class-methods logical_or
            importing value(a) type any
                      value(b) type any
            returning value(result) type casdk_raw_boolean.

    private section.
        data attr_value type casdk_raw_boolean value casdk_false.
        class-data attr_true type ref to casdk_boolean.
        class-data attr_false type ref to casdk_boolean.

endclass.
*--------------------------------------------------------------*

" Immutable String wrapper for raw string values
class casdk_string definition create private inheriting from casdk_object.
    public section.
        constants max_length type casdk_raw_integer value 65535.

        "! Initializes the object value.
        "! @parameter value    | Raw string value to be assigned
        methods constructor
            importing value(value) type casdk_raw_string.

        "! Returns the current raw string value of the object
        methods get_value
            returning value(result) type casdk_raw_string.

        "! Returns a new string object of replacing a text for a new one a given amount of times.
        "! @parameter text         | Text to be replaced.
        "! @parameter new_text     | The text that will replace the old one
        "! @parameter times        | Number of occurrences to be replaced. By default all occurrences will be replaced
        methods replace
            importing value(text)       type casdk_raw_string
                      value(new_text)   type casdk_raw_string
                      value(times)      type casdk_raw_integer optional
            returning value(result)     type ref to casdk_string.

        methods hash_code redefinition.
        methods equals redefinition.
        methods to_string redefinition.

        "! Evaluates if a given object or variable has a valid raw string value
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_a_valid_raw_value
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a long object
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_string_object
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Factory that creates a new String object based on a raw string value
        "! If a casdk_object is given it will try to cast it.
        "! @parameter obj    | Raw string value to be assigned or casdk_object to be casted
        class-methods value_of
            importing value(obj) type any
            returning value(result) type ref to casdk_string
            raising casdk_nullpointer_exception
                    casdk_cast_exception.

    private section.
        data attr_value type casdk_raw_string.
endclass.
*--------------------------------------------------------------*

" Immutable Integer wrapper for raw integer values
class casdk_integer definition create private inheriting from casdk_object.
    public section.
        constants max_value type casdk_raw_integer value  2147483647.
        constants min_value type casdk_raw_integer value -2147483648.

        "! Initializes the object value.
        "! @parameter value    | Raw integer value to be assigned
        methods constructor
            importing value(value) type casdk_raw_integer.

        "! Returns the current raw integer value of the object
        methods get_value
            returning value(result) type casdk_raw_integer.

        methods hash_code redefinition.
        methods equals redefinition.
        methods to_string redefinition.

        "! Evaluates if a given object or variable has a valid raw integer value
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_a_valid_raw_value
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is an integer object
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_integer_object
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Factory that creates a new Integer object based on a raw integer value
        "! If a casdk_object is given it will try to cast it.
        "! @parameter obj    | Raw integer value to be assigned or casdk_object to be casted
        class-methods value_of
            importing value(obj) type any
            returning value(result) type ref to casdk_integer
            raising casdk_nullpointer_exception
                    casdk_cast_exception.

    private section.
        data attr_value type casdk_raw_integer.
endclass.
*--------------------------------------------------------------*

" Immutable Float wrapper for raw float values
class casdk_float definition create private inheriting from casdk_object.
    public section.
        constants max_value type casdk_raw_float value  '99999999999999999.99999999999999'.
        constants min_value type casdk_raw_float value '-99999999999999999.99999999999999'.

        "! Initializes the object value.
        "! @parameter value    | Raw float value to be assigned
        methods constructor
            importing value(value) type casdk_raw_float.

        "! Returns the current raw float value of the object
        methods get_value
            returning value(result) type casdk_raw_float.

        methods hash_code redefinition.
        methods equals redefinition.
        methods to_string redefinition.

        "! Evaluates if a given object or variable has a valid raw float value
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_a_valid_raw_value
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a float object
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_float_object
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Factory that creates a new Float object based on a raw float value
        "! If a casdk_object is given it will try to cast it.
        "! @parameter obj    | Raw float value to be assigned or casdk_object to be casted
        class-methods value_of
            importing value(obj) type any
            returning value(result) type ref to casdk_float
            raising casdk_nullpointer_exception
                    casdk_cast_exception.

    private section.
        data attr_value type casdk_raw_float.

        "Returns a IEEE 754 binary string representation of the float value of the object"
        methods to_ieee754_single_precision
            returning value(result) type casdk_raw_string.
endclass.
*--------------------------------------------------------------*

" Immutable Long wrapper for raw long values
class casdk_long definition create private inheriting from casdk_object.
    public section.
        constants max_value type casdk_raw_long value  '9999999999999999999999999999999'.
        constants min_value type casdk_raw_long value '-9999999999999999999999999999999'.

        "! Initializes the object value.
        "! @parameter value    | Raw long value to be assigned
        methods constructor
            importing value(value) type casdk_raw_long.

        "! Returns the current raw long value of the object
        methods get_value
            returning value(result) type casdk_raw_long.

        methods hash_code redefinition.
        methods equals redefinition.
        methods to_string redefinition.

        "! Evaluates if a given object or variable has a valid raw long value
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_a_valid_raw_value
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a long object
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_long_object
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Factory that creates a new Long object based on a raw long value
        "! If a casdk_object is given it will try to cast it.
        "! @parameter obj    | Raw long value to be assigned or casdk_object to be casted
        class-methods value_of
            importing value(obj) type any
            returning value(result) type ref to casdk_long
            raising casdk_nullpointer_exception
                    casdk_cast_exception.

    private section.
        data attr_value type casdk_raw_long.
endclass.
*--------------------------------------------------------------*

" Immutable Byte wrapper for raw byte values
class casdk_byte definition create private inheriting from casdk_object.
    public section.
        constants max_value type casdk_raw_byte value '7FFFFFFE'.
        constants min_value type casdk_raw_byte value '00000000'.

        "! Evaluates if a given object or variable has a valid raw byte value
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_a_valid_raw_value
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a byte object
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_byte_object
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.
endclass.
*--------------------------------------------------------------*

" Immutable Byte String wrapper for raw byte string values
class casdk_byte_string definition create private inheriting from casdk_object.
    public section.
        "! Evaluates if a given object or variable has a valid raw byte string value
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_a_valid_raw_value
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a byte string object
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_byte_string_object
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.
endclass.
*--------------------------------------------------------------*

" Immutable Date wrapper for raw date values
class casdk_date definition create private inheriting from casdk_object.
    public section.
        constants format type casdk_raw_string value 'YYYYMMDD'.

        "! Evaluates if a given object or variable has a valid raw date value
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_a_valid_raw_value
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a date object
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_date_object
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.
endclass.
*--------------------------------------------------------------*

" Immutable Time wrapper for raw time values
class casdk_time definition create private inheriting from casdk_object.
    public section.
        constants format type casdk_raw_string value 'HHMMSS'.

        "! Evaluates if a given object or variable has a valid raw time value
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_a_valid_raw_value
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a time object
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_time_object
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.
endclass.
*--------------------------------------------------------------*

" Wrapper for standard ABAP tables that emulates the behavior of lists in other programming languages
class casdk_list definition create private inheriting from casdk_object.
    public section.

        "! Returns an object stored at a given index
        "! @parameter index    | Integer raw value with the position of the object to retrieve
        methods get
            importing value(index) type casdk_raw_integer
            returning value(result) type ref to casdk_object
            raising casdk_index_out_of_bounds_ex.

        "! Returns the current size of the list
        methods size
            returning value(result) type casdk_raw_integer.

        "! Appends an object to the end of the list
        "! @parameter obj    | Object to be stored
        methods add
            importing value(obj) type ref to casdk_object.

        "! Adds an object at a given index of the list
        "! @parameter index    | Integer raw value with the position where the object should be inserted
        "! @parameter obj      | Object to be stored
        methods add_at_index
            importing value(index) type casdk_raw_integer
                      value(obj) type ref to casdk_object
            raising casdk_index_out_of_bounds_ex.

        "! Removes an object stored at a given index
        "! @parameter index    | Integer raw value with the position of the object to remove
        methods remove
            importing value(index) type casdk_raw_integer
            returning value(result) type ref to casdk_object
            raising casdk_index_out_of_bounds_ex.

        "! Returns a new empty casdk_list object
        class-methods create_empty_list
            returning value(result) type ref to casdk_list.

    private section.
        types:
            begin of list_element,
                obj type ref to casdk_object,
            end of list_element.

        data attr_list type standard table of list_element with empty key.
endclass.
*--------------------------------------------------------------*

"! Class with console utilities and helpers
class casdk_console definition create private final inheriting from casdk_object.
    public section.
        constants line_size     type i value 180.

        "! Print to console a given object or variable
        "! @parameter obj    | Object or Variable to be printed
        class-methods print
            importing value(obj) type any default casdk_empty
            raising casdk_cast_exception
                    casdk_runtime_exception.

        "! Print to console a given object or variable and adds a new line at the end
        "! @parameter obj    | Object or Variable to be printed
        class-methods println
            importing value(obj) type any default casdk_empty
            raising casdk_cast_exception
                    casdk_runtime_exception.

    private section.
        class-data is_print_line_size_set type casdk_raw_boolean value casdk_false.
        class-data print_buffer type casdk_raw_integer value line_size.

        "! Reduces the amount of characters available in the current report line.
        class-methods reduce_print_buffer
            importing value(amount) type casdk_raw_integer
            raising casdk_runtime_exception.

        "! Resets the amount of characters available to the value casdk_console=>line_size
        class-methods reset_print_buffer.
endclass.
*--------------------------------------------------------------*

"! Class with type related utilities
class casdk_utils definition create private final inheriting from casdk_object.
    public section.
        "! Transforms a decimal number into a binary string representation
        "! result format {sign}{integer_part}{.{fraction_part} OPTIONAL}
        "! @parameter input    | Input number in decimal base
        class-methods decimal_to_binary
            importing value(input) type casdk_raw_float
            returning value(result) type casdk_raw_string.

        "! Transforms a binary string representation of a number into a decimal value
        "! @parameter input    | Binary string representation
        class-methods binary_to_decimal
            importing value(input) type casdk_raw_string
            returning value(result) type casdk_raw_float.

        "! Evaluates if a given object or variable is a pointer
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_pointer
            importing value(obj)    type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object is a pointer with no reference
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_null_pointer
            importing value(obj)    type any
            returning value(result) type casdk_raw_boolean.
endclass.
*--------------------------------------------------------------*