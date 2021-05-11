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
            me->if_t100_dyn_msg~msgv1 = casdk_empty.
        else.
            me->if_t100_dyn_msg~msgv1 = msgv1.
        endif.

        if msgv2 is initial.
            me->if_t100_dyn_msg~msgv2 = casdk_empty.
        else.
            me->if_t100_dyn_msg~msgv2 = msgv2.
        endif.

        if msgv3 is initial.
            me->if_t100_dyn_msg~msgv3 = casdk_empty.
        else.
            me->if_t100_dyn_msg~msgv3 = msgv3.
        endif.

        if msgv4 is initial.
            me->if_t100_dyn_msg~msgv4 = casdk_empty.
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

    method generate_exception_message.
        if strlen( text ) <= 45.
            concatenate '«' text '»' into quoted_text respecting blanks.
        else.
            data(cropped_text) = substring( val = text off = 0 len = 45 ).
            concatenate '«' cropped_text '...»' into quoted_text respecting blanks.
        endif.
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_runtime_exception implementation.
    method constructor ##ADT_SUPPRESS_GENERATION.
        super->constructor(  ).
        if msgv1 is initial.
            me->if_t100_dyn_msg~msgv1 = casdk_empty.
        else.
            me->if_t100_dyn_msg~msgv1 = msgv1.
        endif.

        if msgv2 is initial.
            me->if_t100_dyn_msg~msgv2 = casdk_empty.
        else.
            me->if_t100_dyn_msg~msgv2 = msgv2.
        endif.

        if msgv3 is initial.
            me->if_t100_dyn_msg~msgv3 = casdk_empty.
        else.
            me->if_t100_dyn_msg~msgv3 = msgv3.
        endif.

        if msgv4 is initial.
            me->if_t100_dyn_msg~msgv4 = casdk_empty.
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

class casdk_nullpointer_exception implementation.
    method raise_exception.
        raise exception type casdk_nullpointer_exception
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

class casdk_cast_exception implementation.
    method raise_exception.
        raise exception type casdk_cast_exception
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

class casdk_invalid_type_exception implementation.
    method raise_exception.
        raise exception type casdk_invalid_type_exception
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

class casdk_overflow_exception implementation.
    method raise_exception.
        raise exception type casdk_overflow_exception
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

class casdk_index_out_of_bounds_ex implementation.
    method raise_exception.
        raise exception type casdk_index_out_of_bounds_ex
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


*--------------------------------------------------------------*
* CLASSES                                                      *
*--------------------------------------------------------------*

class casdk_object implementation.
    " Public Instance Methods
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
        data(full_abap_class_name) = cl_abap_classdescr=>get_class_name( me ).
        split full_abap_class_name at '\CLASS=' into table data(tokens).
        read table tokens into result index 2.
    endmethod.

    method hash_code.
        result = me->attr_hash_code.
    endmethod.

    method equals.
        describe field obj type data(obj_type).
        if casdk_object=>is_object( obj ) and obj is initial.
            result = casdk_false.
            return.
        endif.
        if casdk_object=>is_object( obj ).
            if obj = me.
                result = casdk_true.
                return.
            endif.
        endif.
        result = casdk_false.
    endmethod.

    method to_string.
        data hash_code_str type casdk_raw_string.
        data(class_name) = me->class_name(  ).
        hash_code_str =  me->attr_hash_code.
        concatenate class_name '@' hash_code_str into result.
        condense result no-gaps.
    endmethod.

    " Public Static Methods
    method is_object.
        describe field obj type data(obj_type).
        if obj_type = 'r' and obj is instance of casdk_object.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_boolean implementation.
    " Public Instance Methods
    method constructor.
        super->constructor(  ).
        me->attr_value = bool.
    endmethod.

    method get_value.
         result = me->attr_value.
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
        if casdk_object=>is_object( obj ) and obj is initial.
            result = casdk_false.
            return.
        endif.
        if casdk_boolean=>is_boolean_object( obj ) = casdk_true.
            data(obj_cast) = cast casdk_boolean( obj ).
            if obj_cast->get_value(  ) = me->get_value( ).
                result = casdk_true.
                return.
            endif.
        endif.
        if casdk_boolean=>is_a_valid_raw_value( obj ) and obj = me->get_value( ).
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

    " Public Static Methods
    method is_a_valid_raw_value.
        describe field obj type data(obj_type).
        if obj_type = 'C' and ( obj = casdk_true or obj = casdk_false ).
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.

    method is_boolean_object.
        if casdk_object=>is_object( obj ) = casdk_true and obj is instance of casdk_boolean.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
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
        if casdk_boolean=>is_a_valid_raw_value( obj ) = casdk_true.
            if obj = casdk_true.
                result = casdk_boolean=>true(  ).
            else.
                result = casdk_boolean=>false(  ).
            endif.
            return.
        endif.
        if casdk_utils=>is_null_pointer( obj ) = casdk_true.
            new casdk_nullpointer_exception( msgv1 = 'Null pointers can not be interpreted as booleans' )->raise_exception(  ).
        endif.
        if casdk_boolean=>is_boolean_object( obj ) = casdk_true.
            result = cast casdk_boolean( obj ).
            return.
        endif.
        new casdk_cast_exception( msgv1 = 'The value can not be interpreted as boolean' )->raise_exception(  ).
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
endclass.
*--------------------------------------------------------------*

class casdk_string implementation.
    " Public Instance Methods
    method constructor.
        super->constructor(  ).
        me->attr_value = value.
    endmethod.

    method get_value.
        result = me->attr_value.
    endmethod.

    method replace.
        data(replaced_string) = me->get_value(  ).
        if times < 0.
            result = new casdk_string( replaced_string ).
            return.
        elseif times = 0.
            while replaced_string cs text.
                replace text with new_text into replaced_string.
            endwhile.
        else.
            data(i) = 0.
            while replaced_string cs text and i < times.
                    replace text with new_text into replaced_string.
                    i = i + 1.
            endwhile.
        endif.
        result = new casdk_string( replaced_string ).
    endmethod.

    method hash_code.
    endmethod.

    method equals.
    endmethod.

    method to_string.
        result = me->get_value(  ).
    endmethod.

    " Public Static Methods
    method is_a_valid_raw_value.
        describe field obj type data(obj_type).
        if obj_type = 'C' or obj_type = 'g'.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.

    method is_string_object.
        if casdk_object=>is_object( obj ) = casdk_true and obj is instance of casdk_string.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.

    method value_of.
        if casdk_string=>is_a_valid_raw_value( obj ) = casdk_true.
            result =  new casdk_string( obj ).
            return.
        endif.
        if casdk_object=>is_object( obj ) = casdk_true.
            if obj is initial.
                new casdk_nullpointer_exception( msgv1 = 'Initial objects can not be interpreted as strings' )->raise_exception(  ).
            endif.
            if casdk_string=>is_string_object( obj ) = casdk_true.
                result = cast casdk_string( obj ).
                return.
            endif.
        endif.
        new casdk_cast_exception( msgv1 = 'The value can not be interpreted as a string' )->raise_exception(  ).
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_integer implementation.
    " Public Instance Methods
    method constructor.
        super->constructor(  ).
        me->attr_value = value.
    endmethod.

    method get_value.
        result = me->attr_value.
    endmethod.

    method hash_code.
        result = me->attr_value.
    endmethod.

    method equals.
        describe field obj type data(obj_type).
        if casdk_object=>is_object( obj ) and obj is initial.
            result = casdk_false.
            return.
        endif.
        if casdk_integer=>is_integer_object( obj ) = casdk_true.
            data(obj_cast) = cast casdk_integer( obj ).
            if obj_cast->get_value(  ) = me->get_value( ).
                result = casdk_true.
                return.
            endif.
        endif.
        if casdk_integer=>is_a_valid_raw_value( obj ) and obj = me->get_value( ).
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.

    method to_string.
        result = me->attr_value.
    endmethod.

    " Public Static Methods
    method is_a_valid_raw_value.
        describe field obj type data(obj_type).
        if obj_type = 'I'.
            result = casdk_true.
            return.
        elseif obj_type = 'P' or obj_type = 'F'.
            constants min type casdk_raw_long value casdk_integer=>min_value.
            constants max type casdk_raw_long value casdk_integer=>max_value.
            data obj_as_long type casdk_raw_long.
            obj_as_long = obj.
            if min <= obj_as_long and obj_as_long <= max.
                result = casdk_true.
                return.
            endif.
        endif.
        result = casdk_false.
    endmethod.

    method is_integer_object.
        if casdk_object=>is_object( obj ) = casdk_true and obj is instance of casdk_integer.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.

    method value_of.
        if casdk_integer=>is_a_valid_raw_value( obj ) = casdk_true.
            result =  new casdk_integer( obj ).
            return.
        endif.
        if casdk_object=>is_object( obj ) = casdk_true.
            if obj is initial.
                new casdk_nullpointer_exception( msgv1 = 'Initial objects can not be interpreted as integers' )->raise_exception(  ).
            endif.
            if casdk_integer=>is_integer_object( obj ) = casdk_true.
                result = cast casdk_integer( obj ).
                return.
            endif.
         endif.
         new casdk_cast_exception( msgv1 = 'The value can not be interpreted as an integer' )->raise_exception(  ).
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_float implementation.
    " Public Instance Methods
    method constructor.
        super->constructor(  ).
        me->attr_value = value.
    endmethod.

    method get_value.
        result = me->attr_value.
    endmethod.

     method hash_code.
        data(iee754) = me->to_ieee754_single_precision(  ).
        data(long_rep) = trunc( casdk_utils=>binary_to_decimal( iee754 ) ).
        while long_rep > 2147483647.
            data(overflow) = long_rep - 2147483647.
            long_rep = -2147483649 + overflow.
        endwhile.
        result = long_rep.
    endmethod.

    method equals.
        describe field obj type data(obj_type).
        if casdk_object=>is_object( obj ) and obj is initial.
            result = casdk_false.
            return.
        endif.
        if casdk_float=>is_float_object( obj ) = casdk_true.
            data(obj_cast) = cast casdk_float( obj ).
            if obj_cast->get_value(  ) = me->get_value( ).
                result = casdk_true.
                return.
            endif.
        endif.
        if casdk_float=>is_a_valid_raw_value( obj ) and obj = me->get_value( ).
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.

    method to_string.
        result = me->attr_value.
    endmethod.


    " Public Static Methods
    method is_a_valid_raw_value.
        describe field obj type data(obj_type).
        if obj_type = 'I' or obj_type = 'F'.
            result = casdk_true.
            return.
        elseif obj_type = 'P'.
            constants min type casdk_raw_long value casdk_float=>min_value.
            constants max type casdk_raw_long value casdk_float=>max_value.
            data obj_as_long type casdk_raw_long.
            obj_as_long = obj.
            if min <= obj_as_long and obj_as_long <= max.
                result = casdk_true.
                return.
            endif.
        endif.
        result = casdk_false.
    endmethod.

    method is_float_object.
        if casdk_object=>is_object( obj ) = casdk_true and obj is instance of casdk_float.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.

    method value_of.
        if casdk_float=>is_a_valid_raw_value( obj ) = casdk_true.
            result =  new casdk_float( obj ).
            return.
        endif.
        if casdk_object=>is_object( obj ) = casdk_true.
            if obj is initial.
                new casdk_nullpointer_exception( msgv1 = 'Initial objects can not be interpreted as floats' )->raise_exception(  ).
            endif.
            if casdk_float=>is_float_object( obj ) = casdk_true.
                result = cast casdk_float( obj ).
                return.
            endif.
         endif.
         new casdk_cast_exception( msgv1 = 'The value can not be interpreted as a float' )->raise_exception(  ).
    endmethod.

    " Private Instance methods
    method to_ieee754_single_precision.
        if me->get_value( ) = 0.
            result = '00000000000000000000000000000000'.
            return.
        endif.
        constants sign_bits_size type casdk_raw_integer value 1.
        constants exponent_bits_size type casdk_raw_integer value 8.
        constants mantissa_bits_size type casdk_raw_integer value 23.
        constants bias type casdk_raw_integer value 127.
        data sign type casdk_raw_string value '0'.
        data bits_available type casdk_raw_integer value mantissa_bits_size.
        data(binary_rep) = casdk_utils=>decimal_to_binary( me->get_value( ) ).
        split binary_rep at '.' into table data(parts).
        read table parts into data(integer_part) index 1.
        if integer_part(1) = '-'.
            split integer_part at '-' into table data(integer_parts).
            read table integer_parts into integer_part index 2.
            sign = '1'.
        endif.
        if lines( parts ) > 1.
            read table parts into data(fraction_part) index 2.
        endif.
        data exponent_decimal type casdk_raw_float value 0.
        data mantissa type casdk_raw_string.
        if integer_part > 1.
            exponent_decimal = 127 + strlen( integer_part ) - 1.
            data(integer_and_fraction) = integer_part && fraction_part.
            data(len_integer_and_fraction) = strlen( integer_and_fraction ).
            mantissa = substring( val = integer_and_fraction off = 1 len = len_integer_and_fraction - 1 ).
        elseif fraction_part is not initial.
            find first occurrence of '1' in fraction_part match offset data(index).
            exponent_decimal = 127 - index.
            index = index + 1.
            data(len_fraction_part) = strlen( fraction_part ).
            mantissa = substring( val = fraction_part off = index len = len_fraction_part - index ).
        endif.
        data(data_exponent_binary) = casdk_utils=>decimal_to_binary( exponent_decimal ).
        while strlen( data_exponent_binary ) < exponent_bits_size.
            concatenate '0' data_exponent_binary into data_exponent_binary.
            condense data_exponent_binary no-gaps.
        endwhile.
        data(size_mantissa) = strlen( mantissa ).
        if size_mantissa > mantissa_bits_size.
            data(last_bit) = substring( val = mantissa off = mantissa_bits_size len = 1 ).
            data(pre_lastbit) = substring( val = mantissa off = mantissa_bits_size - 1 len = 1 ).
            if last_bit = 1 and pre_lastbit = 1.
                mantissa = substring( val = mantissa off = 0 len = mantissa_bits_size - 1 ) && '0'.
            elseif last_bit = 1 and pre_lastbit = 0.
                mantissa = substring( val = mantissa off = 0 len = mantissa_bits_size - 1 ) && '1'.
            elseif last_bit = 0.
                mantissa = substring( val = mantissa off = 0 len = mantissa_bits_size ).
            endif.
        endif.
        while strlen( mantissa ) < mantissa_bits_size.
            concatenate mantissa '0' into mantissa.
            condense mantissa no-gaps.
        endwhile.
        concatenate sign data_exponent_binary mantissa into result.
        condense result no-gaps.
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_long implementation.
    " Public Instance Methods
    method constructor.
        super->constructor(  ).
        me->attr_value = value.
    endmethod.

    method get_value.
        result = me->attr_value.
    endmethod.

    method hash_code.
    endmethod.

    method equals.
    endmethod.

    method to_string.
    endmethod.

    " Public Static Methods
    method is_a_valid_raw_value.
        describe field obj type data(obj_type).
        if obj_type = 'I' or obj_type = 'F' or obj_type = 'P'.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.

    method is_long_object.
        if casdk_object=>is_object( obj ) = casdk_true and obj is instance of casdk_long.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.

    method value_of.
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_byte implementation.
    " Public Static Methods
    method is_a_valid_raw_value.
        try.
            data cast type casdk_raw_byte.
            cast = obj.
            result = casdk_true.
            return.
        catch cx_root.
            result = casdk_false.
        endtry.
    endmethod.

    method is_byte_object.
        if casdk_object=>is_object( obj ) = casdk_true and obj is instance of casdk_byte.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_byte_string implementation.
    " Public Static Methods
    method is_a_valid_raw_value.
        try.
            data cast type casdk_raw_byte_string.
            cast = obj.
            result = casdk_true.
            return.
        catch cx_root.
            result = casdk_false.
        endtry.
    endmethod.

    method is_byte_string_object.
        if casdk_object=>is_object( obj ) = casdk_true and obj is instance of casdk_byte_string.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_date implementation.
    " Public Static Methods
    method is_a_valid_raw_value.
        try.
            data cast type casdk_raw_date.
            cast = obj.
            result = casdk_true.
            return.
        catch cx_root.
            result = casdk_false.
        endtry.
    endmethod.

    method is_date_object.
        if casdk_object=>is_object( obj ) = casdk_true and obj is instance of casdk_date.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_time implementation.
    " Public Static Methods
    method is_a_valid_raw_value.
        try.
            data cast type casdk_raw_time.
            cast = obj.
            result = casdk_true.
            return.
        catch cx_root.
            result = casdk_false.
        endtry.
    endmethod.

    method is_time_object.
        if casdk_object=>is_object( obj ) = casdk_true and obj is instance of casdk_time.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_console implementation.
    " Public Static Methods
    method print.
        if ( casdk_console=>print_buffer ) < 0.
            new casdk_runtime_exception( msgv1 = 'The print buffer cant have a size less than 0' )->raise_exception(  ).
        endif.

        data out type casdk_raw_string.
        data escaped_newline type casdk_raw_string value '\\n'.
        data escaped_newline_placeholder type casdk_raw_string value '{{CASDKNEWLINE}}'.
        data newline_char type casdk_raw_string value '\n'.
        data newline_abap type casdk_raw_string  value %_NEWLINE.
        data escape_new_line type casdk_raw_boolean value casdk_true.

        if casdk_string=>is_a_valid_raw_value( obj ) = casdk_true.
            concatenate out obj into out respecting blanks.
        elseif casdk_utils=>is_pointer( obj ) = casdk_true.
            if obj is instance of casdk_exception.
                data(cast_exception) = cast casdk_exception( obj ).
                out = cast_exception->get_message(  ).
            elseif obj is instance of casdk_runtime_exception.
                data(cast_runtime_exception) = cast casdk_runtime_exception( obj ).
                out = cast_runtime_exception->get_message(  ).
            elseif obj is instance of casdk_object.
                data(cast_obj) = cast casdk_object( obj ).
                out = cast_obj->to_string(  ).
            else.
                new casdk_cast_exception(
                    msgv1 = 'The print method could not'
                    msgv2 = 'interpret the object as a string'
                )->raise_exception(  ).
            endif.
        else.
            try.
                out = obj.
            catch cx_root.
                new casdk_cast_exception(
                    msgv1 = 'The print method could not'
                    msgv2 = 'interpret the object as a string'
                )->raise_exception(  ).
            endtry.
        endif.

        if casdk_console=>is_print_line_size_set = casdk_false.
            new-page line-size casdk_console=>line_size.
            casdk_console=>is_print_line_size_set = casdk_true.
        endif.

        if out is initial.
            return.
        endif.

        if escape_new_line = casdk_true.
            data(escaped_string) = casdk_string=>value_of( out ).
            escaped_string = escaped_string->replace( text = escaped_newline new_text = escaped_newline_placeholder ).
            escaped_string = escaped_string->replace( text = newline_char new_text = newline_abap ).
            escaped_string = escaped_string->replace( text = escaped_newline_placeholder new_text = escaped_newline ).
            out = escaped_string->to_string( ).
        endif.

        data(str_len) = strlen( out ).
        data remainder type casdk_raw_integer value 0.
        data last_char_pos type casdk_raw_integer value 0.
        data partial_out type casdk_raw_string.
        data pos_newline type casdk_raw_integer.

        remainder = str_len.
        while remainder <> 0.
            if remainder >= casdk_console=>print_buffer.
                partial_out = substring( val = out off = last_char_pos len = casdk_console=>print_buffer ).
                if partial_out cs newline_abap.
                    find first occurrence of newline_abap in partial_out match offset pos_newline.
                    partial_out = substring( val = partial_out off = 0 len = pos_newline ).
                    write partial_out no-gap.
                    skip.
                    casdk_console=>reset_print_buffer(  ).
                    remainder =  remainder - ( pos_newline + 1 ).
                    last_char_pos = last_char_pos + pos_newline + 1.
                    continue.
                endif.
                write partial_out no-gap.
                casdk_console=>reset_print_buffer(  ).
                last_char_pos = last_char_pos + casdk_console=>print_buffer.
                remainder = remainder - casdk_console=>print_buffer.
            else.
                partial_out = substring( val = out off = last_char_pos len = remainder ).
                if partial_out cs newline_abap.
                    find first occurrence of newline_abap in partial_out match offset pos_newline.
                    partial_out = substring( val = partial_out off = 0 len = pos_newline ).
                    write partial_out no-gap.
                    skip.
                    casdk_console=>reset_print_buffer(  ).
                    remainder =  remainder - ( pos_newline + 1 ).
                    last_char_pos = last_char_pos + pos_newline + 1.
                    continue.
                endif.
                write partial_out no-gap.
                casdk_console=>reduce_print_buffer( remainder ).
                last_char_pos = last_char_pos + remainder.
                remainder = 0.
            endif.
        endwhile.
    endmethod.

    method println.
        casdk_console=>print( obj ).
        skip.
        casdk_console=>reset_print_buffer(  ).
    endmethod.

    " Private Static Methods
    method reduce_print_buffer.
        if ( casdk_console=>print_buffer - amount ) < 0.
            new casdk_runtime_exception( msgv1 = 'The print buffer cant have a size less than 0' )->raise_exception(  ).
        endif.
        casdk_console=>print_buffer = casdk_console=>print_buffer - amount.
    endmethod.

    method reset_print_buffer.
        casdk_console=>print_buffer = casdk_console=>line_size.
    endmethod.
endclass.
*--------------------------------------------------------------*

class casdk_utils implementation.
    " Public Static Methods
    method decimal_to_binary.
        data integer_part type casdk_raw_long.
        data fraction_part type casdk_raw_float.
        data integer_operation_result type casdk_raw_long.
        data fraction_operation_result type casdk_raw_float.
        data binary_bit type casdk_raw_string.
        constants fraction_precision type casdk_raw_integer value 24.
        integer_part = trunc( abs( input ) ).
        fraction_part = frac( abs( input ) ).
        if integer_part = 0.
            result = '0'.
        else.
            binary_bit = integer_part mod 2.
            integer_operation_result = integer_part div 2.
            concatenate binary_bit result into result.
            while integer_operation_result > 0.
                binary_bit = integer_operation_result mod 2.
                integer_operation_result = integer_operation_result div 2.
                concatenate binary_bit result into result.
            endwhile.
        endif.
        if fraction_part > 0.
            concatenate result '.' into result.
            fraction_operation_result = fraction_part * 2.
            if fraction_operation_result > 1.
                fraction_operation_result =  frac( fraction_operation_result ).
                binary_bit = 1.
            else.
                binary_bit = 0.
            endif.
            concatenate result binary_bit into result.
            data(count) = 0.
            while fraction_operation_result > 0 and count < fraction_precision.
                fraction_operation_result = fraction_operation_result * 2.
                if fraction_operation_result > 1.
                    fraction_operation_result =  frac( fraction_operation_result ).
                    binary_bit = 1.
                else.
                    binary_bit = 0.
                endif.
                concatenate result binary_bit into result.
                count = count + 1.
            endwhile.
        endif.
        if input < 0.
            concatenate '-' result into result.
        endif.

        "Regex: ^(?P<sign>-?)(?P<integer_part>\d+)(?P<fraction_part>\.\d+)?$
        condense result no-gaps.
    endmethod.

    method binary_to_decimal.
        data sign type casdk_raw_integer value 1.
        split input at '.' into table data(parts).
        read table parts into data(integer_part) index 1.
        if integer_part(1) = '-'.
            split integer_part at '-' into table data(integer_parts).
            read table integer_parts into integer_part index 2.
            sign = -1.
        endif.
        if lines( parts ) > 1.
            read table parts into data(fraction_part) index 2.
        endif.
        data(i) = 0.
        data(integer_part_length) = strlen( integer_part  ).
        while i < integer_part_length.
            data(integer_bit) =  integer_part+i(1).
            if integer_bit <> 1 and integer_bit <> 0.
                new casdk_cast_exception(
                    msgv1 = 'The binary representation contains'
                    msgv2 = 'an invalid character that is not "1" or "0"' )->raise_exception(  ).
            endif.
            i = i + 1.
            result = result + ( integer_bit * ( 2 ** ( integer_part_length - i ) ) ).
        endwhile.
        data(j) = 0.
        data(fraction_part_length) = strlen( fraction_part  ).
        while j < fraction_part_length.
            data(fraction_bit) =  fraction_part+j(1).
            if fraction_bit <> 1 and fraction_bit <> 0.
                new casdk_cast_exception(
                    msgv1 = 'The binary representation contains'
                    msgv2 = 'an invalid character that is not "1" or "0"' )->raise_exception(  ).
            endif.
            j = j + 1.
            result = result + ( fraction_bit * ( 2 ** ( - j ) ) ).
        endwhile.
        result = sign * result.
    endmethod.

    method is_pointer.
        describe field obj type data(obj_type).
        if obj_type = 'r'.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.

    method is_null_pointer.
        if casdk_utils=>is_pointer( obj ) and obj is initial.
            result = casdk_true.
            return.
        endif.
        result = casdk_false.
    endmethod.
endclass.
*--------------------------------------------------------------*