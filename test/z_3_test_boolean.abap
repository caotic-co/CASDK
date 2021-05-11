*--------------------------------------------------------------*
* Test z_3_test_boolean                                        *
*--------------------------------------------------------------*
* Author: Camilo A. Ospina A.                                  *
* Version: 1.0.0                                               *
* Original Source Code: https://github.com/caotic-co/CASDK     *
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

"! Test for casdk_boolean
report z_3_test_boolean.

include: z_casdk_definition, z_casdk_implementation.

class lcl_abap_object definition inheriting from object. endclass.

class boolean_tests definition for testing duration short risk level harmless.
    public section.
        "! Validates the creation of objects matches the assigned raw boolean value.
        methods true_false_get_value for testing.

        "! Validates the creation of objects matches the assigned raw boolean value.
        methods value_of_get_value for testing.

        "! Validates an object is correctly negated
        methods logical_not for testing.

        "! Validates the logical 'AND' operation
        methods logical_and for testing.

        "! Validates the logical 'OR' operation
        methods logical_or for testing.

        "! Validates the nesting of logical operations works correctly
        methods nested_logical_operations for testing.

        "! Validates the hash_code is correct and corresponds to the boolean value.
        methods hash_code for testing.

        "! Validates two objects are the same.
        methods equals for testing.

        "! Validates the string generated for the object.
        methods to_string for testing.

        "! Validates the behavior of the method is_a_valid_raw_value
        methods is_a_valid_raw_value for testing.

        "! Validates the behavior of the method is_boolean_object
        methods is_boolean_object for testing.
endclass.
class boolean_tests implementation.
    method true_false_get_value.
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>true( )->get_value(  )
            msg = 'CASE 1: The Boolean object value is not true'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_boolean=>false( )->get_value(  )
            msg = 'CASE 2: The Boolean object value is not false'
        ).
    endmethod.

    method value_of_get_value.
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>value_of( casdk_true )->get_value(  )
            msg = 'CASE 1: The Boolean object value is not true'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_boolean=>value_of( casdk_false )->get_value(  )
            msg = 'CASE 2: The Boolean object value is not false'
        ).

        try.
            data empty_boolean type ref to casdk_boolean.
            casdk_boolean=>value_of( empty_boolean ).
            cl_aunit_assert=>fail(
                msg = 'CASE 3: A casdk_nullpointer_exception should have been raised'
            ).
        catch casdk_nullpointer_exception into data(e).
            " Do Nothing
        endtry.
    endmethod.

    method logical_not.
        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_boolean=>logical_not( casdk_boolean=>true( ) )
            msg = 'CASE 1: The negation of the Boolean object should be false'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_not( casdk_boolean=>false( ) )
            msg = 'CASE 2: The negation of the Boolean object should be true'
        ).

        data empty_bool type ref to casdk_boolean.
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_not( empty_bool )
            msg = 'CASE 3: The negation of an empty object should be true'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_not( '' )
            msg = 'CASE 4: The negation of an empty string should be true'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_not( casdk_boolean=>logical_not( casdk_true ) )
            msg = 'CASE 5: Double negation should be the original value'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_not( casdk_boolean=>logical_not(  casdk_boolean=>true( ) ) )
            msg = 'CASE 6: Double negation should be the original value'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_not( 0 )
            msg = 'CASE 7: Negation of initial values should be true'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_boolean=>logical_not( 1 )
            msg = 'CASE 8: Negation of non initial values should be false'
        ).
    endmethod.

    method logical_and.
        data boolean_a type ref to casdk_boolean.
        data boolean_b type ref to casdk_boolean.

        boolean_a = casdk_boolean=>false( ).
        boolean_b = casdk_boolean=>false( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_boolean=>logical_and(
                a = boolean_a
                b = boolean_b
            )
            msg = 'CASE 1: (false && false) should be false'
        ).

        boolean_a = casdk_boolean=>true( ).
        boolean_b = casdk_boolean=>false( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_boolean=>logical_and(
                a = boolean_a
                b = boolean_b
            )
            msg = 'CASE 2: (true && false) should be false'
        ).

        boolean_a = casdk_boolean=>false( ).
        boolean_b = casdk_boolean=>true( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_boolean=>logical_and(
                a = boolean_a
                b = boolean_b
            )
            msg = 'CASE 3: (false && true) should be false'
        ).

        boolean_a = casdk_boolean=>true( ).
        boolean_b = casdk_boolean=>true( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_and(
                a = boolean_a
                b = boolean_b
            )
            msg = 'CASE 4: (true && true) should be true'
        ).

        boolean_a = casdk_boolean=>true( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_and(
                a = boolean_a
                b = casdk_true
            )
            msg = 'CASE 5: (true && true) should be true'
        ).

        boolean_b = casdk_boolean=>false( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_boolean=>logical_and(
                a = casdk_true
                b = boolean_b
            )
            msg = 'CASE 6: (true && false) should be false'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_and(
                a = 123
                b = 123
            )
            msg = 'CASE 7: (123 && 123) should be true'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_and(
                a = 'Non empty string'
                b = 'Non empty string'
            )
            msg = 'CASE 8: ("Non empty string" && "Non empty string") should be true'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_boolean=>logical_and(
                a = 1
                b = 0
            )
            msg = 'CASE 9: (1 && 0) should be false'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_and(
                a = 'Non empty string'
                b = 123
            )
            msg = 'CASE 10: ("Non empty string" && 123) should be true'
        ).

        boolean_b = casdk_boolean=>false( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_boolean=>logical_and(
                a = 'Non empty string'
                b = boolean_b
            )
            msg = 'CASE 11: ("Non empty string" && false) should be false'
        ).
    endmethod.

    method logical_or.
        data boolean_a type ref to casdk_boolean.
        data boolean_b type ref to casdk_boolean.

        boolean_a = casdk_boolean=>false( ).
        boolean_b = casdk_boolean=>false( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_boolean=>logical_or(
                a = boolean_a
                b = boolean_b
            )
            msg = 'CASE 1: (false || false) should be false'
        ).

        boolean_a = casdk_boolean=>true( ).
        boolean_b = casdk_boolean=>false( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_or(
                a = boolean_a
                b = boolean_b
            )
            msg = 'CASE 2: (true || false) should be true'
        ).

        boolean_a = casdk_boolean=>false( ).
        boolean_b = casdk_boolean=>true( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_or(
                a = boolean_a
                b = boolean_b
            )
            msg = 'CASE 3: (false || true) should be true'
        ).

        boolean_a = casdk_boolean=>true( ).
        boolean_b = casdk_boolean=>true( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_or(
                a = boolean_a
                b = boolean_b
            )
            msg = 'CASE 4: (true || true) should be true'
        ).

        boolean_a = casdk_boolean=>true( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_or(
                a = boolean_a
                b = casdk_true
            )
            msg = 'CASE 5: (true || true) should be true'
        ).

        boolean_b = casdk_boolean=>false( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_or(
                a = casdk_true
                b = boolean_b
            )
            msg = 'CASE 6: (true || false) should be true'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_or(
                a = 123
                b = 123
            )
            msg = 'CASE 7: (123 || 123) should be true'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_or(
                a = 'Non empty string'
                b = 'Non empty string'
            )
            msg = 'CASE 8: ("Non empty string" || "Non empty string") should be true'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_or(
                a = 1
                b = 0
            )
            msg = 'CASE 9: (1 || 0) should be true'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_or(
                a = 'Non empty string'
                b = 123
            )
            msg = 'CASE 10: ("Non empty string" || 123) should be true'
        ).

        boolean_b = casdk_boolean=>false( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>logical_or(
                a = 'Non empty string'
                b = boolean_b
            )
            msg = 'CASE 11: ("Non empty string" || false) should be true'
        ).
    endmethod.

    method nested_logical_operations.
        data operation type casdk_raw_boolean.

        operation = casdk_boolean=>logical_and(
            a = casdk_boolean=>logical_or( a = casdk_false b = casdk_true )
            b = casdk_boolean=>logical_not(
                casdk_boolean=>logical_or( a = casdk_false b = casdk_false )
            )
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = operation
            msg = 'CASE 1: ( (false || true) && NOT(false || false) )'
        ).

        operation = casdk_boolean=>logical_or(
            a = casdk_boolean=>logical_and( a = casdk_false b = casdk_true )
            b = casdk_boolean=>logical_not(
                casdk_boolean=>logical_and( a = casdk_true b = casdk_true )
            )
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = operation
            msg = 'CASE 2: ( (false && true) || NOT(true && true) )'
        ).
    endmethod.

    method equals.
        data boolean_a type ref to casdk_boolean.
        data boolean_b type ref to casdk_boolean.

        boolean_a = casdk_boolean=>true( ).
        boolean_b = casdk_boolean=>true( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = boolean_a->equals( boolean_b )
            msg = 'CASE 1: Both objects should be equal'
        ).

        boolean_a = casdk_boolean=>true( ).
        boolean_b = casdk_boolean=>false( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = boolean_a->equals( boolean_b )
            msg = 'CASE 2: The objects should not be equal'
        ).

        boolean_a = casdk_boolean=>true( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = boolean_a->equals( 'X' )
            msg = 'CASE 3: The comparison should be true'
        ).

        boolean_a = casdk_boolean=>false( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = boolean_a->equals( '' )
            msg = 'CASE 4: The comparison should be true'
        ).

        boolean_a = casdk_boolean=>true( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = boolean_a->equals( 1 )
            msg = 'CASE 5: The comparison should be false'
        ).

        boolean_a = casdk_boolean=>true( ).
        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = boolean_a->equals( 'random text' )
            msg = 'CASE 6: The comparison should be false'
        ).
    endmethod.


    method hash_code.
        cl_aunit_assert=>assert_equals(
            exp = 1231
            act = casdk_boolean=>true( )->hash_code(  )
            msg = 'CASE 1: The generated hash should be 1231'
        ).

        cl_aunit_assert=>assert_equals(
            exp = 1237
            act = casdk_boolean=>false( )->hash_code(  )
            msg = 'CASE 2: The generated hash should be 1237'
        ).
    endmethod.

    method to_string.
        cl_aunit_assert=>assert_equals(
            exp = 'true'
            act = casdk_boolean=>true( )->to_string(  )
            msg = 'CASE 1: The generated string should be true'
        ).

        cl_aunit_assert=>assert_equals(
            exp = 'false'
            act = casdk_boolean=>false( )->to_string(  )
            msg = 'CASE 2: The generated string should be false'
        ).
    endmethod.

    method is_a_valid_raw_value.
        data(casdK_bool_obj) = casdk_boolean=>true(  ).
        data(abap_obj) = new lcl_abap_object(  ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_boolean=>is_a_valid_raw_value( obj = casdK_bool_obj )
            msg = 'CASE 1: casdK_bool_obj should not be a valid boolean raw value'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_boolean=>is_a_valid_raw_value( obj = abap_obj )
            msg = 'CASE 2: abap_obj should not be a valid boolean raw value'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>is_a_valid_raw_value( obj = casdk_true )
            msg = 'CASE 3: casdk_true should be a valid boolean raw value'
        ).
    endmethod.

    method is_boolean_object.
        data(casdK_bool_obj) = casdk_boolean=>true(  ).
        data(abap_obj) = new lcl_abap_object(  ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_true
            act = casdk_boolean=>is_boolean_object( obj = casdK_bool_obj )
            msg = 'CASE 1: casdK_bool_obj should be a casdk_boolean'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_boolean=>is_boolean_object( obj = abap_obj )
            msg = 'CASE 2: abap_obj should not be a casdk_boolean'
        ).

        cl_aunit_assert=>assert_equals(
            exp = casdk_false
            act = casdk_boolean=>is_boolean_object( obj = casdk_true )
            msg = 'CASE 3: casdk_true should not be a casdk_boolean'
        ).
    endmethod.
endclass.