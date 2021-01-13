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
* CASDK CONFIGURABLE PARAMETERS                                *
*--------------------------------------------------------------*

constants:
    casdk_confparam_line_size     type i value 180.


*--------------------------------------------------------------*
* CASDK RAW TYPES                                              *
*--------------------------------------------------------------*
types     casdk_type_name         type string.

types     casdk_raw_boolean       type c length 1.
constants casdk_typ_boolean       type casdk_type_name value 'casdk_raw_boolean'.

types     casdk_raw_integer       type i.
constants casdk_typ_integer       type casdk_type_name value 'casdk_raw_integer'.

types     casdk_raw_float         type f.
constants casdk_typ_float         type casdk_type_name value 'casdk_raw_float'.

types     casdk_raw_long          type dec20.
constants casdk_typ_long          type casdk_type_name value 'casdk_raw_long'.

types     casdk_raw_string        type string.
constants casdk_typ_string        type casdk_type_name value 'casdk_raw_string'.

types     casdk_raw_byte          type x length 32000.
constants casdk_typ_byte          type casdk_type_name value 'casdk_raw_byte'.

types     casdk_raw_byte_string   type xstring.
constants casdk_typ_byte_string   type casdk_type_name value 'casdk_raw_byte_string'.

types     casdk_raw_date          type d.
constants casdk_typ_date          type casdk_type_name value 'casdk_raw_date'.

types     casdk_raw_time          type t.
constants casdk_typ_time          type casdk_type_name value 'casdk_raw_time'.

types     casdk_raw_message       type c length 50.
constants casdk_typ_message       type casdk_type_name value 'casdk_raw_message'.

constants casdk_typ_cl_object     type casdk_type_name value 'casdk_cl_object'.

constants:
    casdk_true  type casdk_raw_boolean value 'X',
    casdk_false type casdk_raw_boolean value ' ',
    casdk_empty type casdk_raw_string  value ''.


*--------------------------------------------------------------*
* CASDK METADATA                                               *
*--------------------------------------------------------------*

"! Class containing methods about information of the CASDK
class casdk_cl_metadata definition final create private.
    public section.
        constants:
            major_version  type casdk_raw_integer  value 1,
            minor_version  type casdk_raw_integer  value 0,
            patch_version  type casdk_raw_integer  value 0.

        "! Returns the current installed version of the CASDK
        "! @parameter full_version    | Current version formatted as '{MAJOR}.{MINOR}.{PATCH}'
        class-methods full_version
            returning value(full_version) type casdk_raw_string.
endclass.


*--------------------------------------------------------------*
* EXCEPTIONS                                                   *
*--------------------------------------------------------------*

"! Base exception for all CASDK static exceptions
class casdk_cx_static_exception definition create public inheriting from cx_static_check.
    public section.
        interfaces if_t100_dyn_msg.

        "! Initializes the exception
        "! @parameter msgv1    | First message line of the exceptions's reason
        "! @parameter msgv2    | Second message line of the exceptions's reason
        "! @parameter msgv3    | Third message line of the exceptions's reason
        "! @parameter msgv4    | Fourth message line of the exceptions's reason
        methods constructor
            importing value(msgv1) type casdk_raw_message optional
                      value(msgv2) type casdk_raw_message optional
                      value(msgv3) type casdk_raw_message optional
                      value(msgv4) type casdk_raw_message optional.

        "! Returns the full message associated to the exception
        methods get_message
            returning value(result) type casdk_raw_string.

        "! Raises a new exception with the current messages
        methods raise_exception
            raising casdk_cx_static_exception.
endclass.
*--------------------------------------------------------------*

"! Base exception for all CASDK dynamic exceptions
class casdk_cx_dynamic_exception definition create public inheriting from cx_dynamic_check.
    public section.
        interfaces if_t100_dyn_msg.

        "! Initializes the exception
        "! @parameter msgv1    | First message line of the exceptions's reason
        "! @parameter msgv2    | Second message line of the exceptions's reason
        "! @parameter msgv3    | Third message line of the exceptions's reason
        "! @parameter msgv4    | Fourth message line of the exceptions's reason
        methods constructor
            importing value(msgv1) type casdk_raw_message optional
                      value(msgv2) type casdk_raw_message optional
                      value(msgv3) type casdk_raw_message optional
                      value(msgv4) type casdk_raw_message optional.

        "! Returns the full message associated to the exception
        methods get_message
            returning value(result) type casdk_raw_string.

        "! Raises a new exception with the current messages
        methods raise_exception
            raising casdk_cx_dynamic_exception.
endclass.
*--------------------------------------------------------------*

"! Raised when the reference to an object is not initialized
class casdk_cx_nullpointer definition create public inheriting from casdk_cx_dynamic_exception.
    public section.
        methods raise_exception redefinition.
endclass.
*--------------------------------------------------------------*

"! Raised when a cast fails to be performed
class casdk_cx_cast_error definition create public inheriting from casdk_cx_dynamic_exception.
    public section.
        methods raise_exception redefinition.
endclass.
*--------------------------------------------------------------*

"! Raised when an invalid type is used
class casdk_cx_invalid_type definition create public inheriting from casdk_cx_dynamic_exception.
    public section.
        methods raise_exception redefinition.
endclass.
*--------------------------------------------------------------*

"! Raised when an overflow has presented
class casdk_cx_overflow_error definition create public inheriting from casdk_cx_dynamic_exception.
    public section.
        methods raise_exception redefinition.
endclass.
*--------------------------------------------------------------*

"! Raised when an index is bigger that the supported range
class casdk_cx_index_out_of_bounds definition create public inheriting from casdk_cx_dynamic_exception.
    public section.
        methods raise_exception redefinition.
endclass.
*--------------------------------------------------------------*

"! Raised when a string has the wrong format to be a number
class casdk_cx_numberformat definition create public inheriting from casdk_cx_dynamic_exception.
    public section.
        methods raise_exception redefinition.
endclass.
*--------------------------------------------------------------*

"! Raised when an error occurs during an arithmetic operation
class casdk_cx_arithmetic definition create public inheriting from casdk_cx_dynamic_exception.
    public section.
        methods raise_exception redefinition.
endclass.


*--------------------------------------------------------------*
* CLASSES                                                      *
*--------------------------------------------------------------*

"! Base class for all CASDK objects
class casdk_cl_object definition create public.
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

      "! Compares if the current object is equal to another casdk_cl_object
      "! @parameter obj      | Object to compare against
      "! @parameter result   | Result bool flag of the comparison
      methods equals
          importing value(obj) type any
          returning value(result) type casdk_raw_boolean.

      "! Returns the representation of the object as a string
      "! @parameter result    | Generated string representation
      methods to_string
          returning value(result) type casdk_raw_string.

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

"! CASDK boolean object
class casdk_cl_boolean definition create private inheriting from casdk_cl_object.
    public section.
        "! Initializes the object value.
        "! @parameter bool    | Raw boolean value to be assigned
        methods constructor
            importing value(bool) type casdk_raw_boolean.

        "! Returns the current boolean value of the object
        "! @parameter result    | Current raw boolean value of the object
        methods get_value
            returning value(result) type casdk_raw_boolean.

        "! Factory that creates a new Boolean object with a true value
        "! @parameter result    | Generated true casdk_cl_boolean object
        class-methods true
            returning value(result) type ref to casdk_cl_boolean.

        "! Factory that creates a new Boolean object with a false value
        "! @parameter result    | Generated false casdk_cl_boolean object
        class-methods false
            returning value(result) type ref to casdk_cl_boolean.

        "! Factory that creates a new Boolean object based on a casdk_raw_boolean raw value
        "! @parameter result    | Generated casdk_cl_boolean object
        class-methods value_of
            importing value(bool) type casdk_raw_boolean
            returning value(result) type ref to casdk_cl_boolean.

        "! Logical 'NOT' operation between Boolean objects
        "! @parameter boolean    | Input to be negated
        "! @parameter result     | Raw boolean value generated from negating the input
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

        methods hash_code redefinition.
        methods equals redefinition.
        methods to_string redefinition.

    private section.
        data attr_value type casdk_raw_boolean value casdk_false.
        class-data attr_true type ref to casdk_cl_boolean.
        class-data attr_false type ref to casdk_cl_boolean.

endclass.
*--------------------------------------------------------------*

"! Class with utilities and helpers for the CASDK
class casdk_cl_utils definition create private final inheriting from casdk_cl_object.
    public section.

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

        "! Evaluates if a given object or variable is a casdk_cl_object
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_cl_object
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a boolean
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_boolean
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is an integer
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_integer
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a float
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_float
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a long
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_long
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given value is a string
        "! @parameter value    | Value to be evaluated
        class-methods is_string
            importing value(value)  type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a byte
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_byte
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a string representation of a byte
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_byte_string
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a date
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_date
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a time
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_time
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.

        "! Evaluates if a given object or variable is a message string
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_message
            importing value(obj) type any
            returning value(result) type casdk_raw_boolean.


        "! Evaluates if a given value is numeric
        "! @parameter value    | Value to be evaluated
        class-methods is_numeric
            importing value(value)  type any
            returning value(result) type casdk_raw_boolean.

        "! Replaces a text for a new one a given amount of times in an input string.
        "! @parameter input_str    | String where the text is going to be replaced
        "! @parameter text         | Text to be replaced.
        "! @parameter new_text     | The text that will replace the old one
        "! @parameter times        | Number of occurrences to be replaced. By default all occurrences will be replaced
        "! @parameter result       | Result string after the replacement.
        class-methods replace
            importing value(input_str)  type casdk_raw_string
                      value(text)       type casdk_raw_string
                      value(new_text)   type casdk_raw_string
                      value(times)      type casdk_raw_integer optional
            returning value(result)     type casdk_raw_string.

        "! Print to console a given object or variable
        "! @parameter obj                        | Object or Variable to be printed
        "! @raising casdk_cx_cast_error          | Error if the object can't interpreted as string
        "! @raising casdk_cx_dynamic_exception   | Error if the object can't be printed
        class-methods print
            importing value(obj) type any default casdk_empty
            raising casdk_cx_cast_error
                    casdk_cx_dynamic_exception.

        "! Print to console a given object or variable and adds a new line at the end
        "! @parameter obj                        | Object or Variable to be printed
        "! @raising casdk_cx_cast_error          | Error if the object can't interpreted as string
        "! @raising casdk_cx_dynamic_exception   | Error if the object can't be printed
        class-methods println
            importing value(obj) type any default casdk_empty
            raising casdk_cx_cast_error
                    casdk_cx_dynamic_exception.

        "! Returns a quoted representation message of a string.
        "! @parameter text    | Raw string to be quoted.
        class-methods string_to_quoted_message
            importing value(text) type casdk_raw_string
            returning value(quoted_text) type casdk_raw_message.

    private section.
        class-data is_print_line_size_set type casdk_raw_boolean value casdk_false.
        class-data print_buffer type casdk_raw_integer value casdk_confparam_line_size.

        class-methods reduce_print_buffer
            importing value(amount) type casdk_raw_integer
            raising casdk_cx_dynamic_exception.

        class-methods reset_print_buffer.
endclass.
*--------------------------------------------------------------*

"! Data structure for storing and retrieving elements of different types
class casdk_cl_list definition create private inheriting from casdk_cl_object.
    public section.
        "! Initialize the list with a given type restriction
        "! @parameter list_type              | Type of elements the list will store
        "! @raising casdk_cx_invalid_type    | Exception raised if the given type for the list is unsupported
        methods constructor
            importing value(list_type) type casdk_type_name
            raising casdk_cx_invalid_type.

        "! Adds a new element to the list
        "! @parameter element                | Element to be be added
        "! @raising casdk_cx_invalid_type    | Exception raised if the given type for the list is unsupported
        methods append
            importing value(element) type any
            raising casdk_cx_invalid_type.

        methods to_string redefinition.

        "! Evaluates if a given type is valid to create lists.
        "! @parameter type_name    | Object or Variable to be evaluated
        class-methods is_valid_type_name
            importing value(type_name) type casdk_type_name
            returning value(result) type casdk_raw_boolean.

        "! Static factory that creates a list of a given type
        "! @parameter list_type              | Type of elements the list will store
        "! @raising casdk_cx_invalid_type    | Exception raised if the given type for the list is unsupported
        class-methods of
            importing value(list_type) type casdk_type_name
            returning value(result) type ref to casdk_cl_list
            raising casdk_cx_invalid_type.

    private section.
        types:
            begin of casdk_local_typ_list_element,
                integer_value type casdk_raw_integer,
                float_value type casdk_raw_float,
                long_value type casdk_raw_long,
                string_value type casdk_raw_string,
                byte_value type casdk_raw_byte,
                byte_string_value type casdk_raw_byte_string,
                date_value type casdk_raw_date,
                time_value type casdk_raw_time,
                obj_value type ref to casdk_cl_object,
            end of casdk_local_typ_list_element.

        types casdk_local_typ_bucket type standard table of casdk_local_typ_list_element with default key.
        types casdk_local_typ_bucket_array type standard table of casdk_local_typ_bucket with default key.

        constants bucket_limit       type casdk_raw_integer value 10. "value 2000000000. " must be an even amount that be exactly divided by 2
        constants bucket_array_limit type casdk_raw_integer value 5. "value 1000000000. " must be the half of bucket_limit
        constants list_max_size type casdk_raw_long value 50. "value 2000000000000000000. "must be equal to: bucket_limit * bucket_array_limit

        data list_type type casdk_type_name.
        data length type casdk_raw_long value 0.
        data elements type casdk_local_typ_bucket_array.
endclass.
*--------------------------------------------------------------*