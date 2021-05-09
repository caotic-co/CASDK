*--------------------------------------------------------------*
* Test z_1_test_exceptions                                     *
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

"! Test for the casdk exceptions
report z_1_test_exceptions.

include: z_casdk_definition, z_casdk_implementation.

class tests_exceptions definition for testing duration short risk level harmless.
  public section.
    "! Validates the behavior of the casdk_cx_exception class.
    methods test_cx_exception for testing.

    "! Validates the behavior of the casdk_cx_runtime_exception class.
    methods test_cx_runtime_exception for testing.

    "! Validates the behavior of the casdk_cx_nullpointer class.
    methods test_cx_nullpointer for testing.

    "! Validates the behavior of the casdk_cx_cast_error class.
    methods test_cx_cast_error for testing.

    "! Validates the behavior of the casdk_cx_invalid_type class.
    methods test_cx_invalid_type for testing.

    "! Validates the behavior of the casdk_cx_overflow_error
    methods test_cx_overflow_error for testing.

    "! Validates the behavior of the casdk_cx_index_out_of_bounds
    methods test_cx_index_out_of_bounds for testing.

    "! Validates the behavior of the casdk_cx_numberformat class.
    methods test_cx_numberformat for testing.

    "! Validates the behavior of the casdk_cx_arithmetic class.
    methods test_cx_arithmetic for testing.
endclass.
class tests_exceptions implementation.
    method test_cx_exception.
        try.
            new casdk_cx_exception(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_cx_exception.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_cx_exception"' ).
            endif.
            data(cast_ex) = cast casdk_cx_exception( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.

        cl_aunit_assert=>assert_equals(
            exp = '«123456789123456789123456789123456789123456789»'
            act = casdk_cx_exception=>string_to_quoted_cx_message( '123456789123456789123456789123456789123456789' )
            msg = 'CASE 2: The string is not correctly quoted'
        ).

        cl_aunit_assert=>assert_equals(
            exp = '«123456789123456789123456789123456789123456789...»'
            act = casdk_cx_exception=>string_to_quoted_cx_message( '123456789123456789123456789123456789123456789abcdef' )
            msg = 'CASE 3: The string is not correctly quoted'
        ).

        cl_aunit_assert=>assert_equals(
            exp = '«»'
            act = casdk_cx_exception=>string_to_quoted_cx_message( '' )
            msg = 'CASE 4: The string is not correctly quoted'
        ).
    endmethod.

    method test_cx_runtime_exception.
        try.
            new casdk_cx_runtime_exception(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_cx_runtime_exception.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_cx_runtime_exception"' ).
            endif.
            data(cast_ex) = cast casdk_cx_runtime_exception( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_cx_nullpointer.
        try.
            new casdk_cx_nullpointer(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_cx_nullpointer.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_cx_nullpointer"' ).
            endif.
            data(cast_ex) = cast casdk_cx_nullpointer( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_cx_cast_error.
        try.
            new casdk_cx_cast_error(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_cx_cast_error.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_cx_cast_error"' ).
            endif.
            data(cast_ex) = cast casdk_cx_cast_error( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_cx_invalid_type.
        try.
            new casdk_cx_invalid_type(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_cx_invalid_type.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_cx_invalid_type"' ).
            endif.
            data(cast_ex) = cast casdk_cx_invalid_type( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_cx_overflow_error.
        try.
            new casdk_cx_overflow_error(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_cx_overflow_error.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_cx_overflow_error"' ).
            endif.
            data(cast_ex) = cast casdk_cx_overflow_error( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_cx_index_out_of_bounds.
        try.
            new casdk_cx_index_out_of_bounds(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_cx_index_out_of_bounds.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_cx_index_out_of_bounds"' ).
            endif.
            data(cast_ex) = cast casdk_cx_index_out_of_bounds( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_cx_numberformat.
        try.
            new casdk_cx_numberformat(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_cx_numberformat.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_cx_numberformat"' ).
            endif.
            data(cast_ex) = cast casdk_cx_numberformat( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_cx_arithmetic.
        try.
            new casdk_cx_arithmetic(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_cx_arithmetic.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_cx_arithmetic"' ).
            endif.
            data(cast_ex) = cast casdk_cx_arithmetic( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = cast_ex->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.
endclass.