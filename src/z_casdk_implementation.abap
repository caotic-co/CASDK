*--------------------------------------------------------------*
* CAOTIC ABAP Software Development Kit (CASDK) - Implementation*
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
* EXCEPTIONS                                                   *
*--------------------------------------------------------------*

class casdk_exception implementation.
    method constructor ##ADT_SUPPRESS_GENERATION.
        super->constructor(  ).
        if msgv1 is initial.
            me->if_t100_dyn_msg~msgv1 = ''.
        else.
            me->if_t100_dyn_msg~msgv1 = msgv1.
        endif.

        if msgv2 is initial.
            me->if_t100_dyn_msg~msgv2 = ''.
        else.
            me->if_t100_dyn_msg~msgv2 = msgv2.
        endif.

        if msgv3 is initial.
            me->if_t100_dyn_msg~msgv3 = ''.
        else.
            me->if_t100_dyn_msg~msgv3 = msgv3.
        endif.

        if msgv4 is initial.
            me->if_t100_dyn_msg~msgv4 = ''.
        else.
            me->if_t100_dyn_msg~msgv4 = msgv4.
        endif.
    endmethod.

    method get_message.
        concatenate
            me->if_t100_dyn_msg~msgv1
            me->if_t100_dyn_msg~msgv2
            me->if_t100_dyn_msg~msgv3
            me->if_t100_dyn_msg~msgv4
        into
            result
        separated by space.
    endmethod.

    method raise_exception.
        raise exception type casdk_exception
            message e000(error) with
                me->if_t100_dyn_msg~msgv1
                me->if_t100_dyn_msg~msgv2
                me->if_t100_dyn_msg~msgv3
                me->if_t100_dyn_msg~msgv4
            exporting
                msgv1 = me->if_t100_dyn_msg~msgv1
                msgv2 = me->if_t100_dyn_msg~msgv2
                msgv3 = me->if_t100_dyn_msg~msgv3
                msgv4 = me->if_t100_dyn_msg~msgv4.
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_runtime_exception implementation.
    method constructor ##ADT_SUPPRESS_GENERATION.
        super->constructor(  ).
        if msgv1 is initial.
            me->if_t100_dyn_msg~msgv1 = ''.
        else.
            me->if_t100_dyn_msg~msgv1 = msgv1.
        endif.

        if msgv2 is initial.
            me->if_t100_dyn_msg~msgv2 = ''.
        else.
            me->if_t100_dyn_msg~msgv2 = msgv2.
        endif.

        if msgv3 is initial.
            me->if_t100_dyn_msg~msgv3 = ''.
        else.
            me->if_t100_dyn_msg~msgv3 = msgv3.
        endif.

        if msgv4 is initial.
            me->if_t100_dyn_msg~msgv4 = ''.
        else.
            me->if_t100_dyn_msg~msgv4 = msgv4.
        endif.
    endmethod.

    method get_message.
        concatenate
            me->if_t100_dyn_msg~msgv1
            me->if_t100_dyn_msg~msgv2
            me->if_t100_dyn_msg~msgv3
            me->if_t100_dyn_msg~msgv4
        into
            result
        separated by space.
    endmethod.

    method raise_exception.
        raise exception type casdk_runtime_exception
            message e000(error) with
                me->if_t100_dyn_msg~msgv1
                me->if_t100_dyn_msg~msgv2
                me->if_t100_dyn_msg~msgv3
                me->if_t100_dyn_msg~msgv4
            exporting
                msgv1 = me->if_t100_dyn_msg~msgv1
                msgv2 = me->if_t100_dyn_msg~msgv2
                msgv3 = me->if_t100_dyn_msg~msgv3
                msgv4 = me->if_t100_dyn_msg~msgv4.
    endmethod.

endclass.
*--------------------------------------------------------------*

class casdk_null_pointer_exception implementation.
    method raise_exception.
        raise exception type casdk_null_pointer_exception
            message e000(error) with
                me->if_t100_dyn_msg~msgv1
                me->if_t100_dyn_msg~msgv2
                me->if_t100_dyn_msg~msgv3
                me->if_t100_dyn_msg~msgv4
            exporting
                msgv1 = me->if_t100_dyn_msg~msgv1
                msgv2 = me->if_t100_dyn_msg~msgv2
                msgv3 = me->if_t100_dyn_msg~msgv3
                msgv4 = me->if_t100_dyn_msg~msgv4.
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_numberformat_exception implementation.
    method raise_exception.
        raise exception type casdk_numberformat_exception
            message e000(error) with
                me->if_t100_dyn_msg~msgv1
                me->if_t100_dyn_msg~msgv2
                me->if_t100_dyn_msg~msgv3
                me->if_t100_dyn_msg~msgv4
            exporting
                msgv1 = me->if_t100_dyn_msg~msgv1
                msgv2 = me->if_t100_dyn_msg~msgv2
                msgv3 = me->if_t100_dyn_msg~msgv3
                msgv4 = me->if_t100_dyn_msg~msgv4.
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_arithmetic_exception implementation.
    method raise_exception.
        raise exception type casdk_arithmetic_exception
            message e000(error) with
                me->if_t100_dyn_msg~msgv1
                me->if_t100_dyn_msg~msgv2
                me->if_t100_dyn_msg~msgv3
                me->if_t100_dyn_msg~msgv4
            exporting
                msgv1 = me->if_t100_dyn_msg~msgv1
                msgv2 = me->if_t100_dyn_msg~msgv2
                msgv3 = me->if_t100_dyn_msg~msgv3
                msgv4 = me->if_t100_dyn_msg~msgv4.
    endmethod.
endclass.


*--------------------------------------------------------------*
* CLASSES                                                      *
*--------------------------------------------------------------*

class casdk_info implementation.
    method full_version.
        full_version = |{ casdk_mayor_version }.{ casdk_minor_version }.{ casdk_patch_version }|.
    endmethod.

    method major_version.
        major_version = casdk_mayor_version.
    endmethod.

    method minor_version.
        minor_version = casdk_minor_version.
    endmethod.

    method patch_version.
        patch_version = casdk_patch_version.
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_object implementation.
    method constructor.
        " Assign the hash code for new objects
        data current_class_info type class_info.
        data(current_class_name) = me->class_name(  ).

        read table attr_objects_info into current_class_info with table key ('class_name') = current_class_name.
        if sy-subrc = 0.
            current_class_info-object_count = current_class_info-object_count + 1.
            delete table attr_objects_info with table key ('class_name') = current_class_name.
        else.
            current_class_info-class_name = current_class_name.
            current_class_info-object_count = 0.
        endif.

        insert current_class_info into table attr_objects_info.
        me->attr_hash_code = current_class_info-object_count.
    endmethod.

    method class_name.
        result = cl_abap_classdescr=>get_class_name( me ).
    endmethod.

    method hash_code.
        result = me->attr_hash_code.
    endmethod.

    method equals.
        describe field obj type data(obj_type).

        if obj_type = 'r' and obj is initial.
        result = casdk_false.
        return.
        endif.

        if obj_type = 'r' and obj is instance of casdk_object.
            data(obj_cast) = cast casdk_object( obj ).
            if obj_cast = me.
                result = casdk_true.
                return.
            endif.
        endif.

        result = casdk_false.
    endmethod.

    method to_string.
        data hash_code_str type casdk_str.
        data(class_name) = me->class_name(  ).
        hash_code_str =  me->attr_hash_code.
        concatenate class_name '@' hash_code_str into result.
        condense result no-gaps.
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_boolean implementation.
    method constructor.
        super->constructor(  ).
        me->attr_value = bool.
    endmethod.

    method get_value.
         result = me->attr_value.
    endmethod.

    method true.
        if casdk_boolean=>attr_true is initial.
            casdk_boolean=>attr_true = new casdk_boolean( casdk_true ).
        endif.
        result = casdk_boolean=>attr_true.
    endmethod.

    method false.
        if casdk_boolean=>attr_false is initial.
            casdk_boolean=>attr_false = new casdk_boolean( casdk_false ).
        endif.
        result = casdk_boolean=>attr_false.
    endmethod.

    method value_of.
        if bool = casdk_true.
            result = casdk_boolean=>true(  ).
        else.
            result = casdk_boolean=>false(  ).
        endif.
    endmethod.

    method logical_not.
        if boolean is initial.
           result = casdk_true.
           return.
        endif.

        describe field boolean type data(obj_type).

        if obj_type = 'r' and boolean is instance of casdk_boolean.
            data(obj_cast) = cast casdk_boolean( boolean ).
            if obj_cast->get_value( ) = casdk_false.
                result = casdk_true.
                return.
            endif.
        endif.

        result = casdk_false.
    endmethod.

    method logical_and.
        if ( logical_not( a ) = casdk_false ) and ( logical_not( b ) = casdk_false ).
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.

    method logical_or.
        if ( logical_not( a ) = casdk_false ) or ( logical_not( b ) = casdk_false ).
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.

    method hash_code.
        if me->get_value(  ) = casdk_true.
            result = 1231.
        else.
            result = 1237.
        endif.
    endmethod.

    method equals.
        describe field obj type data(obj_type).

        if obj_type = 'r' and obj is initial.
            result = casdk_false.
            return.
        endif.

        if obj_type = 'r' and obj is instance of casdk_boolean.
            data(obj_cast) = cast casdk_boolean( obj ).
            if obj_cast->get_value(  ) = me->get_value( ).
                result = casdk_true.
                return.
            endif.
        endif.

        if obj_type = 'C' and obj = me->get_value( ).
            result = casdk_true.
            return.
        endif.

        result = casdk_false.
    endmethod.

    method to_string.
        if me->get_value(  ) = casdk_true.
            result = 'true'.
        else.
            result = 'false'.
        endif.
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_utils implementation.
    method is_pointer.
        describe field obj type data(obj_type).
         if obj_type = 'r'.
            result = casdk_true.
            return.
         endif.
         result = casdk_false.
    endmethod.

    method is_null_pointer.
         if casdk_utils=>is_pointer( obj ) = casdk_true and obj is initial.
            result = casdk_true.
            return.
         endif.
         result = casdk_false.
    endmethod.

    method is_string.
        describe field value type data(value_type).
        if value_type = 'C' or value_type = 'g'.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.

    method is_numeric.
        describe field value type data(value_type).
        if value_type = 'P' or value_type = 'I' or value_type = 'F'.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.

    method replace.
        result = input_str.
        if times < 0.
            return.
        elseif times = 0.
            while result cs text.
                replace text with new_text into result.
            endwhile.
        else.
            data(i) = 0.
            while result cs text and i < times.
                    replace text with new_text into result.
                    i = i + 1.
            endwhile.
        endif.
    endmethod.

    method print.
        if ( casdk_utils=>print_buffer ) < 0.
            new casdk_runtime_exception( msgv1 = 'The print buffer cant have a size less than 0' )->raise_exception(  ).
        endif.

        data out type casdk_str.
        data escaped_newline type casdk_str value '\\n'.
        data escaped_newline_placeholder type casdk_str value '{{CASDKNEWLINE}}'.
        data newline_char type casdk_str value '\n'.
        data newline_abap type casdk_str  value %_NEWLINE.

        if casdk_utils=>is_string( obj ) = casdk_true.
            concatenate out obj into out respecting blanks.
        elseif casdk_utils=>is_pointer( obj ) = casdk_true.
            if obj is instance of casdk_object.
                data(cast_obj) = cast casdk_object( obj ).
                out = cast_obj->to_string(  ).
            elseif casdk_utils=>is_pointer( obj ) = casdk_true and obj is instance of casdk_exception.
                data(cast_exception) = cast casdk_exception( obj ).
                out = cast_exception->get_message(  ).
            elseif casdk_utils=>is_pointer( obj ) = casdk_true and obj is instance of casdk_runtime_exception.
                data(cast_runtime_exception) = cast casdk_runtime_exception( obj ).
                out = cast_runtime_exception->get_message(  ).
            else.
                new casdk_runtime_exception(
                    msgv1 = 'The print method could not'
                    msgv2 = 'interpret the object as a string'
                )->raise_exception(  ).
            endif.
        else.
            try.
                out = obj.
            catch cx_root.
                new casdk_runtime_exception(
                    msgv1 = 'The print method could not'
                    msgv2 = 'interpret the object as a string'
                )->raise_exception(  ).
            endtry.
        endif.

        if casdk_utils=>is_print_line_size_set = casdk_false.
            new-page line-size casdk_line_size.
            casdk_utils=>is_print_line_size_set = casdk_true.
        endif.

        if out is initial.
            return.
        endif.

        out = casdk_utils=>replace( input_str = out text = escaped_newline new_text = escaped_newline_placeholder ).
        out = casdk_utils=>replace( input_str = out text = newline_char new_text = newline_abap ).
        out = casdk_utils=>replace( input_str = out text = escaped_newline_placeholder new_text = escaped_newline ).

        data(str_len) = strlen( out ).
        data remainder type casdk_int value 0.
        data last_char_pos type casdk_int value 0.
        data partial_out type casdk_str.
        data pos_newline type casdk_int.

        remainder = str_len.
        while remainder <> 0.
            if remainder >= casdk_utils=>print_buffer.
                partial_out = substring( val = out off = last_char_pos len = casdk_utils=>print_buffer ).
                if partial_out cs newline_abap.
                    find first occurrence of newline_abap in partial_out match offset pos_newline.
                    partial_out = substring( val = partial_out off = 0 len = pos_newline ).
                    write partial_out no-gap.
                    skip.
                    casdk_utils=>reset_print_buffer(  ).
                    remainder =  remainder - ( pos_newline + 1 ).
                    last_char_pos = last_char_pos + pos_newline + 1.
                    continue.
                endif.
                write partial_out no-gap.
                casdk_utils=>reset_print_buffer(  ).
                last_char_pos = last_char_pos + casdk_utils=>print_buffer.
                remainder = remainder - casdk_utils=>print_buffer.
            else.
                partial_out = substring( val = out off = last_char_pos len = remainder ).
                if partial_out cs newline_abap.
                    find first occurrence of newline_abap in partial_out match offset pos_newline.
                    partial_out = substring( val = partial_out off = 0 len = pos_newline ).
                    write partial_out no-gap.
                    skip.
                    casdk_utils=>reset_print_buffer(  ).
                    remainder =  remainder - ( pos_newline + 1 ).
                    last_char_pos = last_char_pos + pos_newline + 1.
                    continue.
                endif.
                write partial_out no-gap.
                casdk_utils=>reduce_print_buffer( remainder ).
                last_char_pos = last_char_pos + remainder.
                remainder = 0.
            endif.
        endwhile.
    endmethod.

    method println.
        casdk_utils=>print( obj ).
        skip.
        casdk_utils=>reset_print_buffer(  ).
    endmethod.

    method reduce_print_buffer.
        if ( casdk_utils=>print_buffer - amount ) < 0.
            new casdk_runtime_exception( msgv1 = 'The print buffer cant have a size less than 0' )->raise_exception(  ).
        endif.
        casdk_utils=>print_buffer = casdk_utils=>print_buffer - amount.
    endmethod.

    method reset_print_buffer.
        casdk_utils=>print_buffer = casdk_line_size.
    endmethod.
endclass.
*--------------------------------------------------------------*