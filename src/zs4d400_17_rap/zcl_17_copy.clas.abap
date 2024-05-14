CLASS zcl_17_copy DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_17_copy IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA t_data TYPE STANDARD TABLE OF z17aflgt.

    SELECT * FROM /dmo/connection INTO CORRESPONDING FIELDS OF TABLE @t_data.
    IF sy-subrc = 0.
      LOOP AT t_data ASSIGNING FIELD-SYMBOL(<s_data>).
        INSERT z17aflgt FROM @<s_data>.
        IF sy-subrc = 0.
          COMMIT WORK.
        ELSE.
          ROLLBACK WORK.
        ENDIF.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
