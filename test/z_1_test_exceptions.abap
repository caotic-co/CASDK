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

class tests_casdk_exceptions definition for testing duration short risk level harmless.
  public section.
    "! Validates the behavior of the casdk_exception class.
    methods test_casdk_exception for testing.

    "! Validates the behavior of the casdk_runtime_exception class.
    methods test_casdk_runtime_exception for testing.

    "! Validates the behavior of the casdk_null_pointer_exception class.
    methods test_casdk_nullpointer_excep for testing.

    "! Validates the behavior of the casdk_numberformat_exception class.
    methods test_casdk_numberformat_excep for testing.

    "! Validates the behavior of the casdk_arithmetic_exception class.
    methods test_casdk_arithmetic_excep for testing.
endclass.
class tests_casdk_exceptions implementation.
    method test_casdk_exception.
        try.
            new casdk_exception(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_exception.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_exception"' ).
            endif.
            data(zcx) = cast casdk_exception( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = zcx->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_casdk_runtime_exception.
        try.
            new casdk_runtime_exception(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_runtime_exception.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_runtime_exception"' ).
            endif.
            data(zcx) = cast casdk_runtime_exception( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = zcx->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_casdk_nullpointer_excep.
        try.
            new casdk_null_pointer_exception(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_null_pointer_exception.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_null_pointer_exception"' ).
            endif.
            data(zcx) = cast casdk_null_pointer_exception( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = zcx->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_casdk_numberformat_excep.
        try.
            new casdk_numberformat_exception(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_numberformat_exception.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_numberformat_exception"' ).
            endif.
            data(zcx) = cast casdk_numberformat_exception( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = zcx->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.

    method test_casdk_arithmetic_excep.
        try.
            new casdk_arithmetic_exception(
                msgv1 = 'Error (Part 1).'
                msgv2 = 'Error (Part 2).'
                msgv3 = 'Error (Part 3).'
                msgv4 = 'Error (Part 4).'
            )->raise_exception(  ).
            cl_aunit_assert=>fail( msg = 'CASE 1: No exception was raised' ).
        catch cx_root into data(e).
            if e is not instance of casdk_arithmetic_exception.
                cl_aunit_assert=>fail( msg = 'CASE 1: The exception class that was raised was not of type "casdk_arithmetic_exception"' ).
            endif.
            data(zcx) = cast casdk_arithmetic_exception( e ).
            cl_aunit_assert=>assert_equals(
                exp = 'Error (Part 1). Error (Part 2). Error (Part 3). Error (Part 4).'
                act = zcx->get_message(  )
                msg = 'CASE 1: The excpetion message does not match the parameters given'
            ).
        endtry.
    endmethod.
endclass.