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
    casdk_raw_boolean               type c length 1,
    casdk_raw_integer               type i,
    casdk_raw_float                 type f,
    casdk_raw_long                  type dec20,
    casdk_raw_string                type string,
    casdk_raw_byte                  type x length 32000,
    casdk_raw_byte_string           type xstring,
    casdk_raw_date                  type d,
    casdk_raw_time                  type t,
    casdk_raw_timestamp             type timestamp,
    casdk_raw_message               type c length 50,
    casdk_raw_boolean_array         type standard table of casdk_raw_boolean            with default key,
    casdk_raw_integer_array         type standard table of casdk_raw_integer            with default key,
    casdk_raw_float_array           type standard table of casdk_raw_float              with default key,
    casdk_raw_long_array            type standard table of casdk_raw_long               with default key,
    casdk_raw_string_array          type standard table of casdk_raw_string             with default key,
    casdk_raw_byte_array            type standard table of casdk_raw_byte               with default key,
    casdk_raw_byte_string_array     type standard table of casdk_raw_byte_string        with default key,
    casdk_raw_boolean_matrix        type standard table of casdk_raw_boolean_array      with default key,
    casdk_raw_integer_matrix        type standard table of casdk_raw_integer_array      with default key,
    casdk_raw_float_matrix          type standard table of casdk_raw_float_array        with default key,
    casdk_raw_long_matrix           type standard table of casdk_raw_long_array         with default key,
    casdk_raw_string_matrix         type standard table of casdk_raw_string_array       with default key,
    casdk_raw_byte_matrix           type standard table of casdk_raw_byte_array         with default key,
    casdk_raw_byte_string_matrix    type standard table of casdk_raw_byte_string_array  with default key.

constants:
    casdk_true  type casdk_raw_boolean value 'X',
    casdk_false type casdk_raw_boolean value ' '.


*--------------------------------------------------------------*
* CASDK CONFIGURATION PARAMETERS                               *
*--------------------------------------------------------------*

constants:
    casdk_confparam_line_size type casdk_raw_integer  value 200.


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


        "! Evaluates if a given value is a string
        "! @parameter value    | Value to be evaluated
        class-methods is_string
            importing value(value)  type any
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
            importing value(obj) type any optional
            raising casdk_cx_cast_error
                    casdk_cx_dynamic_exception.

        "! Print to console a given object or variable and adds a new line at the end
        "! @parameter obj                        | Object or Variable to be printed
        "! @raising casdk_cx_cast_error          | Error if the object can't interpreted as string
        "! @raising casdk_cx_dynamic_exception   | Error if the object can't be printed
        class-methods println
            importing value(obj) type any optional
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