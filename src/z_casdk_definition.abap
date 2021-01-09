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
* RAW TYPES                                                    *
*--------------------------------------------------------------*

types:
    casdk_bool            type c length 1,
    casdk_int             type i,
    casdk_float           type f,
    casdk_long            type dec20,
    casdk_str             type string,
    casdk_byte            type x length 32000,
    casdk_byte_str        type xstring,
    casdk_date            type d,
    casdk_time            type t,
    casdk_timestamp       type timestamp,
    casdk_msg             type c length 50,
    casdk_bool_array      type standard table of casdk_bool            with default key,
    casdk_int_array       type standard table of casdk_int             with default key,
    casdk_float_array     type standard table of casdk_float           with default key,
    casdk_long_array      type standard table of casdk_long            with default key,
    casdk_str_array       type standard table of casdk_str             with default key,
    casdk_byte_array      type standard table of casdk_byte            with default key,
    casdk_byte_str_array  type standard table of casdk_byte_str        with default key,
    casdk_bool_matrix     type standard table of casdk_bool_array      with default key,
    casdk_int_matrix      type standard table of casdk_int_array       with default key,
    casdk_float_matrix    type standard table of casdk_float_array     with default key,
    casdk_long_matrix     type standard table of casdk_long_array      with default key,
    casdk_str_matrix      type standard table of casdk_str_array       with default key,
    casdk_byte_matrix     type standard table of casdk_byte_array      with default key,
    casdk_byte_str_matrix type standard table of casdk_byte_str_array  with default key.


*--------------------------------------------------------------*
* CONSTANTS                                                    *
*--------------------------------------------------------------*

constants:
    casdk_mayor_version  type casdk_int  value 1,
    casdk_minor_version  type casdk_int  value 0,
    casdk_patch_version  type casdk_int  value 0,
    casdk_true           type casdk_bool value 'X',
    casdk_false          type casdk_bool value ' ',
    casdk_line_size      type casdk_int  value 200.


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
            importing value(msgv1) type casdk_msg optional
                      value(msgv2) type casdk_msg optional
                      value(msgv3) type casdk_msg optional
                      value(msgv4) type casdk_msg optional.

        "! Returns the full message associated to the exception
        methods get_message
            returning value(result) type casdk_str.

        "! Raises a new exception with the current messages
        methods raise_exception
            raising casdk_exception.
endclass.
*--------------------------------------------------------------*

"! Base exception for all CASDK dynamic exceptions
class casdk_runtime_exception definition create public inheriting from cx_dynamic_check.
    public section.
        interfaces if_t100_dyn_msg.

        "! Initializes the exception
        "! @parameter msgv1    | First message line of the exceptions's reason
        "! @parameter msgv2    | Second message line of the exceptions's reason
        "! @parameter msgv3    | Third message line of the exceptions's reason
        "! @parameter msgv4    | Fourth message line of the exceptions's reason
        methods constructor
            importing value(msgv1) type casdk_msg optional
                      value(msgv2) type casdk_msg optional
                      value(msgv3) type casdk_msg optional
                      value(msgv4) type casdk_msg optional.

        "! Returns the full message associated to the exception
        methods get_message
            returning value(result) type casdk_str.

        "! Raises a new exception with the current messages
        methods raise_exception
            raising casdk_runtime_exception.
endclass.
*--------------------------------------------------------------*

"! Raised when the reference to an object is not initialized
class casdk_null_pointer_exception definition create public inheriting from casdk_runtime_exception.
    public section.
        methods raise_exception redefinition.
endclass.
*--------------------------------------------------------------*

"! Raised when a string has the wrong format to be a number
class casdk_numberformat_exception definition create public inheriting from casdk_runtime_exception.
    public section.
        methods raise_exception redefinition.
endclass.
*--------------------------------------------------------------*

"! Raised when an error occurs during an arithmetic operation
class casdk_arithmetic_exception definition create public inheriting from casdk_runtime_exception.
    public section.
        methods raise_exception redefinition.
endclass.


*--------------------------------------------------------------*
* CLASSES                                                      *
*--------------------------------------------------------------*

"! Class containing methods about information of the CASDK
class casdk_info definition final create private.
    public section.
        "! Returns the current installed version of the CASDK
        "! @parameter full_version    | Current version formatted as '{MAJOR}.{MINOR}.{PATCH}
        class-methods full_version
            returning value(full_version) type casdk_str.

        "! Returns the current major version as a casdk_int raw type
        "! @parameter major_version    | Current major version int
        class-methods major_version
            returning value(major_version) type casdk_int.

        "! Returns the current minor version as a casdk_int raw type
        "! @parameter minor_version    | Current minor version int
        class-methods minor_version
            returning value(minor_version) type casdk_int.

        "! Returns the current patch version as a casdk_int raw type
        "! @parameter patch_version    | Current patch version int
        class-methods patch_version
            returning value(patch_version) type casdk_int.
endclass.
*--------------------------------------------------------------*

"! Base class for all CASDK objects
class casdk_object definition create public.
    public section.
      "! Initializes the object values.
      methods constructor.

      "! Returns the class_name of the current object
      "! @parameter result    | Retrieved class name
      methods class_name
          returning value(result) type casdk_str.

      "! Generates a hash code that can be used as index in hash data structures.
      "! @parameter result    | Generated hash code
      methods hash_code
          returning value(result) type casdk_str.

      "! Compares if the current object is equal to another casdk_object
      "! @parameter obj      | Object to compare against
      "! @parameter result   | Result bool flag of the comparison
      methods equals
          importing value(obj) type any
          returning value(result) type casdk_bool.

      "! Returns the representation of the object as a string
      "! @parameter result    | Generated string representation
      methods to_string
          returning value(result) type casdk_str.

    private section.
      types:
          begin of class_info,
              class_name   type casdk_str,
              object_count type casdk_long,
          end of class_info.

      class-data attr_objects_info type hashed table of class_info with unique key class_name.

      data attr_hash_code type casdk_long value 0.
endclass.
*--------------------------------------------------------------*

"! CASDK boolean object
class casdk_boolean definition create private inheriting from casdk_object.
    public section.
        "! Initializes the object value.
        "! @parameter bool    | Raw boolean value to be assigned
        methods constructor
            importing value(bool) type casdk_bool.

        "! Returns the current boolean value of the object
        "! @parameter result    | Current raw boolean value of the object
        methods get_value
            returning value(result) type casdk_bool.

        "! Factory that creates a new Boolean object with a true value
        "! @parameter result    | Generated true casdk_boolean object
        class-methods true
            returning value(result) type ref to casdk_boolean.

        "! Factory that creates a new Boolean object with a false value
        "! @parameter result    | Generated false casdk_boolean object
        class-methods false
            returning value(result) type ref to casdk_boolean.

        "! Factory that creates a new Boolean object based on a casdk_bool raw value
        "! @parameter result    | Generated casdk_boolean object
        class-methods value_of
            importing value(bool) type casdk_bool
            returning value(result) type ref to casdk_boolean.

        "! Logical 'NOT' operation between Boolean objects
        "! @parameter boolean    | Input to be negated
        "! @parameter result     | Raw boolean value generated from negating the input
        class-methods logical_not
            importing value(boolean) type any
            returning value(result) type casdk_bool.

        "! Logical 'AND' operation between Boolean objects
        "! @parameter a    | Left predicate element of the operation
        "! @parameter b    | Right predicate element of the operation
        class-methods logical_and
            importing value(a) type any
                      value(b) type any
            returning value(result) type casdk_bool.

        "! Logical 'OR' operation between Boolean objects
        "! @parameter a    | Left predicate element of the operation
        "! @parameter b    | Right predicate element of the operation
        class-methods logical_or
            importing value(a) type any
                      value(b) type any
            returning value(result) type casdk_bool.

        methods hash_code redefinition.
        methods equals redefinition.
        methods to_string redefinition.

    private section.
        data attr_value type casdk_bool value casdk_false.
        class-data attr_true type ref to casdk_boolean.
        class-data attr_false type ref to casdk_boolean.

endclass.
*--------------------------------------------------------------*

"! Class with utilities and helpers for the CASDK
class casdk_utils definition create private final inheriting from casdk_object.
    public section.

        "! Evaluates if a given object or variable is a pointer
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_pointer
            importing value(obj)    type any
            returning value(result) type casdk_bool.

        "! Evaluates if a given object is a pointer with no reference
        "! @parameter obj    | Object or Variable to be evaluated
        class-methods is_null_pointer
            importing value(obj)    type any
            returning value(result) type casdk_bool.


        "! Evaluates if a given value is a string
        "! @parameter value    | Value to be evaluated
        class-methods is_string
            importing value(value)  type any
            returning value(result) type casdk_bool.

        "! Evaluates if a given value is numeric
        "! @parameter value    | Value to be evaluated
        class-methods is_numeric
            importing value(value)  type any
            returning value(result) type casdk_bool.

        "! Replaces a text for a new one a given amount of times in an input string.
        "! @parameter input_str    | String where the text is going to be replaced
        "! @parameter text         | Text to be replaced.
        "! @parameter new_text     | The text that will replace the old one
        "! @parameter times        | Number of occurrences to be replaced. By default all occurrences will be replaced
        "! @parameter result       | Result string after the replacement.
        class-methods replace
            importing value(input_str)  type casdk_str
                      value(text)       type casdk_str
                      value(new_text)   type casdk_str
                      value(times)      type casdk_int optional
            returning value(result)     type casdk_str.

        "! Print to console a given object or variable
        "! @parameter obj                        | Object or Variable to be printed
        "! @raising casdk_runtime_exception      | Error if the object can't be printed
        class-methods print
            importing value(obj) type any optional
            raising casdk_runtime_exception.

        "! Print to console a given object or variable and adds a new line at the end
        "! @parameter obj                        | Object or Variable to be printed
        "! @raising casdk_runtime_exception      | Error if the object can't be printed
        class-methods println
            importing value(obj) type any optional
            raising casdk_runtime_exception.

    private section.
        class-data is_print_line_size_set type casdk_bool value casdk_false.
        class-data print_buffer type casdk_int value casdk_line_size.

        class-methods reduce_print_buffer
            importing value(amount) type casdk_int
            raising casdk_runtime_exception.

        class-methods reset_print_buffer.
endclass.
*--------------------------------------------------------------*