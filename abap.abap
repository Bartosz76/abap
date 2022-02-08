*&---------------------------------------------------------------------*
*& Report  ZBM_TEST5
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT  zbm_test5 LINE-SIZE 255. "Self-explanatory, but this can, apparently, cut the results of tables short. See 1565.

*Comments are fine to explain stuff.

*---------------------------------------------------------------------------------------------------------------------------------
*Below is my first program written with Udemy course.
*---------------------------------------------------------------------------------------------------------------------------------

*DATA d_times TYPE i VALUE 4.
**I can add colon to WRITE and make it a 'statement chain' -> instead of writing WRITE every new line.
*WRITE: '--------------------------'.
*WRITE / '| Invoice number. | Date.|'.
*WRITE / '--------------------------'.
*
*DO 20 TIMES.
*  WRITE / d_times.
*  d_times = d_times + 1.
*  WRITE 15 '3'. "15 means the value will be pushed 15 characters to the right.
*ENDDO.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*Below is my first program written with Udemy course.
*---------------------------------------------------------------------------------------------------------------------------------

*TABLES t005t. "'I will be looking at this table!'

*SELECT * FROM t005t WHERE SPRAS = 'EN'. "Self-explanatory.
*  WRITE: / t005t-LAND1,  "The slash makes sure the results will be written in a column, not in a single line.
*         t005t-LANDX. "I am first selecting table and after a hyphen, comes the field I want to chosen.
*ENDSELECT.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*Below is a program listing materials.
*---------------------------------------------------------------------------------------------------------------------------------

*TABLES mara.

*PARAMETERS: p_name TYPE mara-ERNAM. "A parameter for the selection-screen! Add the prefix 'p_' to the names of parameters. Thanks to this convention, it's clear that a variable comes from the selection screen.

*SELECT * FROM mara UP TO 20 ROWS WHERE ERNAM EQ p_name. "EQ and '=' are used like in Java.
*  WRITE: / mara-MATNR, mara-ERSDA, mara-ERNAM, '|'. "The parameter in the selection-screen is changed because I asked SAP to add the name of the field it's referencing. Skok do -> Elementy tekstowe -> teksty wyboru.
*ENDSELECT.
*WRITE: / '--------------------------------------------'.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*Below is yet another program listing materials.
*---------------------------------------------------------------------------------------------------------------------------------

*TABLES: zbm_mat.

*SELECT * FROM zbm_mat.
*  WRITE: / zbm_mat-material,
*         zbm_mat-description.
*ENDSELECT.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*Below is my first exercise program with Udemy course.
*---------------------------------------------------------------------------------------------------------------------------------

*TABLES: zbm_cust_02.
*
*SELECT * FROM zbm_cust_02 WHERE cust_num = 2.
*  WRITE: / zbm_cust_02-cust_num,
*           zbm_cust_02-cust_name,
*           'Yeah'.
*  ENDSELECT.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*Arithmethic stuff.
*---------------------------------------------------------------------------------------------------------------------------------

*DATA integer01 TYPE i VALUE 22. "Value determines the initial value of the variable.
*DATA decimal01 TYPE p DECIMALS 1 VALUE '-5.7'.
*
*DATA result LIKE decimal01. "That means result is like the type of decimal01.
*
*integer01 = 10. "Changing the value of the variable.
*
*result = integer01 + decimal01.
*
*WRITE: result.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*Character strings -> there are two elementary data types used for character strings. C and N. THESE ARE GENERIC CHARACTER STRING DATA TYPES.
*---------------------------------------------------------------------------------------------------------------------------------

*TABLES: zbm_cust_02.

*C holds 'alpha numeric' characters. Minimum 1 char, max 65.535 chars.
*DATA mychar(10) TYPE c.

*DATA mychar2. "Default value of the size of the field is one character. If I want the length to be of one character, I don't need to decalre
*the size in the brackets.
*Because the character field is the default type used by the system to declare the field, I can not decalre any type.
*mychar2 is the short version for 'DATA mychar2(1) TYPE c.

*DATA zcusts LIKE zbm_cust_02-cust_name. "Character field like the provided variable from the provided table.
*Instead of the above, I could use: 'DATA zcusts(100) TYPE c.' - and it would be the same as the column in the
*table. It's a character field, it's not like Java, I don't need specifically defined types...

*DATA znumber LIKE zbm_cust_02-ord_num.
*Similar as above but refers to the data type NUMC. It's treated like a character type but there's an in-built mechanism that will only
*allow numeric characters to be included.  When data is moved in, it is right aligned just like a regular numeric type field.
*Also, it is perfect to be used when I only want number within the field and have no intention of carrying out any calculations.
*It would be the same if I typed: 'DATA znumber TYPE n.'

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*Logical flow.
*---------------------------------------------------------------------------------------------------------------------------------
*I can have the predefined structure of the if-statement inserted for me with Wzorzec -> mark the Inny Wzorzec at the bottom -> type in
* 'if' and hit enter.

*DATA name(15) TYPE c.
*
*name = 'Dazikiri'.
*
*IF name EQ 'Dazikiri'.
*  WRITE / 'Lancer'.
*ELSEIF name EQ 'Halasibel'.
*  WRITE / 'Shaman'.
*ELSE.
*    WRITE / 'Dont know!'.
*ENDIF.
*
*name = 'Halasibel'.
*
*IF name EQ 'Dazikiri'.
*  WRITE / 'Lancer'.
*ELSEIF name EQ 'Halasibel'.
*  WRITE / 'Shaman'.
*ELSE.
*    WRITE / 'Dont know!'.
*ENDIF.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------








*---------------------------------------------------------------------------------------------------------------------------------
*EVENTS.
*---------------------------------------------------------------------------------------------------------------------------------

*Events -> processing blocks. Sections of code specific for the selection-screens. The stretch of the event starts with the event
*keyword... and does not have an ending. It will be terminated by the start of the next event block. E.g. a sub-program or a report
*(program) ends.
*When I run my executable programs - they are controlled by a predefined process in the runtime environment. The series of processes
*are called one after another. These processes trigger events for which I can define event blocks in my programs.
*When the program is started there are certain events that get fired up in a certain order.
*The first thing is check if I have included any processing blocks (Initialization, At Selection Screen, Start-Of-Selection,
*End-Of-Selection, At-Line-Selection)- if so, it checks which ones I am using.
*Runtime environment will check if I have the Initilization event-block. This event block will only be run once at the very start.
*This block can include the setting of the initial values for fields in my selection screen.
*Then the Runtime Environment will see if the Selection-Screen has been defined. If at least one input field is being used, then
*control will be passed to the Selection Screen Processor which will display the screen to the user. When the user Executes the program,
*the Selection Screen Processor will trigger the At-Selection-Screen event block.
*In the At-Selection-Screen event block, I can write my own code to check the user's input. If the user entered the incorrect values,
*my code can capture these mistakes and, instead of processing the program, I can make the Selection-Screen to be displayed again
*to the user.
*I will use Error Messages to tell the user where the errors are. It can run in a loop until the input is correct.
*When there are no more errors, the Runtime Environment passes control to Start-Of-Selection event block. It can hold the code I create -
*e.g. setting up the values of internal tables, internal fields and so on used in my program and maybe writing out header information on
*the report.
*These are the main event blocks - used for displaying Selection-Screen and capturing user's input which can then be used to process the rest
*of my program.
*Once all my event blocks have been processed, the ABAP Processor will execute the rest of the program and pass control to List Processor
*to output my report! Hence comes the List screen (the effect of all previous processing), but also can be interactive.
*E.g. if I double-click a line, the List Processor will capture that action and fire the At-Selection-Screen event block -> here I can
*include more code to determine what was clicked and what needs to be done next.

*TABLES: zbm_cust_02.
*
*DATA itab TYPE STANDARD TABLE OF zbm_cust_02.
*
*DATA: wa_cust LIKE zbm_cust_02-cust_num.
*
*PARAMETERS: my_cust LIKE zbm_cust_02-cust_num DEFAULT 10 OBLIGATORY.
*
*INITIALIZATION.
*
*  SELECT * FROM zbm_cust_02.
*    wa_cust = zbm_cust_02-cust_num.
*    ENDSELECT.
*
*AT SELECTION-SCREEN ON my_cust.
*  IF my_cust > wa_cust.
*    WRITE: / 'Number jest wi�kszy.'.
*    ULINE.
*  ELSE.
*    WRITE: / 'Numer jest mniejszy.'.
*    ULINE.
*  ENDIF.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*HOW TO GET THE CURRENT DATA AND TIME.
*---------------------------------------------------------------------------------------------------------------------------------

*I can get the current date with the below!
*DATA d_date TYPE d.
*
*d_date = sy-datum.
*
*WRITE / d_date.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*FIRST INCLUDE USING PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------

*INCLUDE zbm_include_test.

*I am basically calling an independent block of code to be used/executed here.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*FIRST FUNCTION MODULE USING PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------

*DATA result LIKE spell.
*
*SELECTION-SCREEN BEGIN OF LINE.
*SELECTION-SCREEN COMMENT 1(15) text-001. "Pula tekst�w/informacji do u�ytku w ekranach wyboru. Istnieje podobny mechanizm dla okienek z komunikatami, ale to co� innego. NIE SZUKA� por�wna� do Javy. To jest stricte ABAPikowa rzecz.
*
*PARAMETER num_1 TYPE i.
*
*SELECTION-SCREEN END OF LINE.
*
*CALL FUNCTION 'SPELL_AMOUNT' "Funkcja, kt�ra pisze w s�owach liczby podane jako integery.
*  EXPORTING
*    amount   = num_1 "Parametr liczbowy...
*  IMPORTING
*    in_words = result. "Zmienna do przechowania wyniku dzia�ania funkcji.
*.
*IF sy-subrc <> 0. "Je�li sy-subrc jest inna ni� 0, to co� posz�o nie tak...
*  WRITE: 'Warto�� zwr�cona to: ', sy-subrc. "Wi�c wydrukuj mi warto�� sy-subrc. Np. 4 mo�e oznacza� b��d.
*ELSE.
*  WRITE: 'Podana liczba w s�owach to: ', result-word. "Je�li sy-subrc nie jest r�ne od 0 (a wi�c ma warto�� 0 - czyli wszystko posz�o jak nale�y), wtedy wydrukuj mi resultat.
*ENDIF.                                                "Dodatek -word wynika z samej funkcji. Zamiast result m�g�bym nazwa� zmienn� np. osio�ek i sk�adnia b�dzie wygl�da�: osio�ek-word.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*FIRST ABAP OOP USING PROGRAM -> exercising. CLASSES.
*---------------------------------------------------------------------------------------------------------------------------------

*CLASS my_first_class DEFINITION.
*  PUBLIC SECTION. "Instead of specifying the access modifier for every variable and method separately, I am defining sections. Everything in this section will be public. The public section will end e.g. when I define private section.
*    DATA: text(45) VALUE 'My First Object'.
*
*    METHODS: display.
*ENDCLASS.                    "my_first_class DEFINITION
*
**----------------------------------------------------------------------*
**       CLASS my_first_class IMPLEMENTATION
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
*CLASS my_first_class IMPLEMENTATION.
*
*  METHOD display.
*
*    WRITE: / 'This is the Display method! My first ABAP OOP method!'.
*  ENDMETHOD.                    "display
*ENDCLASS.                    "display
*
*START-OF-SELECTION.
**The creation of ABAP's object is basically the same as in Java, but looks a bit different.
**In Java, the first thing I do is a reference (Dog dogOne) and THEN I create the object itself (= new Dog();)
**Below is basically the equivalent of Java's: Dog dogOne = new Dog();
*  DATA: my_first_class TYPE REF TO my_first_class. "First I create a reference to the class... This is the 'Dog dogOne' part.
*  CREATE OBJECT: my_first_class. "Then I create the object itself... this is the '= new Dog();' part.
*  WRITE: / my_first_class->text. "Here I am reaching for the variable of the object.
*  CALL METHOD: my_first_class->display. "Here I am reaching for the method of the object.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*SECOND ABAP OOP USING PROGRAM -> exercising. CLASSES.
*---------------------------------------------------------------------------------------------------------------------------------

*CLASS armoury DEFINITION.
*  PUBLIC SECTION.
*    DATA: lol(25) VALUE 'Forging a weapon...'. "lol is just a name. This is basically a field of the class and it can only be defined in the DEFINITION.
*
*    METHODS: forge, call_for_supplies. "If a method is defined here, it has to have an implementation. So, similar to interfaces. Implement all methods.
*ENDCLASS.                    "armoury DEFINITION
*
**----------------------------------------------------------------------*
**       CLASS armoury IMPLEMENTATION
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
**IMPLEMENTATION can only define methods! Variables cannot be defined here... unless they are within a method -> a local variable.
*CLASS armoury IMPLEMENTATION. "ABAP classes are created in two steps, I always have to create a definition and an implementation. In the implementation I just decide what methods will do and I call upon them
*  "then, to answer the call of Gondor, wherever I please within the boundaries of the program.
*  METHOD forge.
*    WRITE: / 'The weapon has been forged!'.
*  ENDMETHOD.                    "forge
*
*  METHOD call_for_supplies.
*    WRITE: / 'Sending the wee lad for more ingots.'.
*  ENDMETHOD.                    "call_for_supplies
*ENDCLASS.           "forge
*
*START-OF-SELECTION.
*  DATA: armoury TYPE REF TO armoury.
*  CREATE OBJECT: armoury.
*  WRITE: / armoury->lol.
*  CALL METHOD: armoury->forge.
*
*  CALL METHOD: armoury->call_for_supplies.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*THIRD ABAP OOP USING PROGRAM -> exercising. ACCESS SECTIONS.
*---------------------------------------------------------------------------------------------------------------------------------

*CLASS army DEFINITION.
*  PUBLIC SECTION.
*    DATA: official_numbers TYPE i VALUE 1000. "In the ABAP code, I need to specify a pre-defined data type (I cannot create mu custom ones, like Data Element in tables).
*    DATA: info TYPE char25 VALUE 'yay'.
*    METHODS: charge.
*
*  PROTECTED SECTION.
*    DATA: protected_numbers TYPE i VALUE 700.
*
*  PRIVATE SECTION.
*    DATA: actual_numbers TYPE i VALUE 400.
*ENDCLASS.                    "army DEFINITION
*
**----------------------------------------------------------------------*
**       CLASS army IMPLEMENTATION
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
*CLASS army IMPLEMENTATION.
*  METHOD charge.
*    WRITE: / 'Charge method called: ',
*       official_numbers,
*       protected_numbers,
*       actual_numbers.
*  ENDMETHOD.                    "charge
*ENDCLASS.         "charge
*
*START-OF-SELECTION.
*  DATA: army TYPE REF TO army.
*  CREATE OBJECT army.
*  CALL METHOD: army->charge. "Here I am calling the method from the object - army.
*  WRITE: / army->official_numbers.
*  WRITE: / army->info. "This will work, because 'info' is defined in the PUBLIC SECTION, thus, it is accessible from whatever.
*WRITE: / army->actual_numbers. "This is not going to work, because actual_numbers is defined in the PRIVATE SECTION. Thus, I cannot just grab it from the level of the object, I need to access it via a method.
"In this case, my method 'charge', basically, assumes the role of... a getter. I access the private field of the class via a method of that class called on an object of the class.
"Just like Java, only a little bit different.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*FOURTH ABAP OOP USING PROGRAM -> exercising. STATIC ATTRIBUTES.
*---------------------------------------------------------------------------------------------------------------------------------

*CLASS rune DEFINITION.
*  PUBLIC SECTION.
*    CLASS-DATA: rune_name TYPE char45,
*                rune_number TYPE i.
*    METHODS: forge_rune.
*ENDCLASS.                    "rune DEFINITION
*
**----------------------------------------------------------------------*
**       CLASS rune IMPLEMENTATION
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
*CLASS rune IMPLEMENTATION.
*  METHOD forge_rune.
*    DO 4 TIMES.
*      rune_number = 1 + rune_number.
*      WRITE: / rune_number, rune_name.
*    ENDDO.
*    SKIP. "Thanks to this, I will see in the output the distinction between rune1's and rune2's callings of the method.
*  ENDMETHOD.                    "forge_rune
*ENDCLASS.                    "rune IMPLEMENTATION
*
*START-OF-SELECTION.
*  rune=>rune_name = 'Fire Rune'. "This way of assigning values will work ONLY for CLASS-DATA (static attributes), it will not work for non-statics (simple DATA).
*  rune=>rune_number = 0.
*
*  DATA: rune1 TYPE REF TO rune,
*        rune2 TYPE REF TO rune.
*
*  CREATE OBJECT: rune1, rune2.
*  CALL METHOD: rune1->forge_rune,
*               rune2->forge_rune. "rune_number is a static attribute, so, despite the default value being set to 0, rune2 will write 5, 6, 7 and 8, because it's a shared attribute and already has been incremented by rune1.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*FIFTH ABAP OOP USING PROGRAM -> exercising. CONSTRUCTOR.
*---------------------------------------------------------------------------------------------------------------------------------

*CLASS dog DEFINITION.
*  PUBLIC SECTION.
*    METHODS: bark, constructor.
*ENDCLASS.                    "dog DEFINITION
*
**----------------------------------------------------------------------*
**       CLASS dog IMPLEMENTATION
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
*CLASS dog IMPLEMENTATION.
*  METHOD bark.
*    WRITE: / 'The dog is barking from a regular method.'.
*  ENDMETHOD.                    "bark
*
*  METHOD constructor. "Constructor makes sure that the logic within the method will be carried out upon the creation of the object.
*    WRITE: / 'The dog is barking from a constructor method!.'.
*  ENDMETHOD.                    "constructor
*ENDCLASS.                    "dog IMPLEMENTATION
*
*START-OF-SELECTION.
*  DATA dog TYPE REF TO dog.
*  CREATE OBJECT dog. "Method 'bark' is never executed because it's never called. 'Constructor' is executed because it happens upon the very creation of an object.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*SIXTH ABAP OOP USING PROGRAM -> exercising. ME operator.
*---------------------------------------------------------------------------------------------------------------------------------

*CLASS example DEFINITION.
*  PUBLIC SECTION.
*    DATA text_initial TYPE char100 VALUE 'This is the initial value of the attribute!'.
*    METHODS: method1.
*ENDCLASS.                    "example DEFINITION
*
**----------------------------------------------------------------------*
**       CLASS example IMPLEMENTATION
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
*CLASS example IMPLEMENTATION.
*  METHOD method1.
*    DATA text_initial TYPE char100 VALUE 'This is the same attribute, but changed by the method!'.
*    WRITE: / me->text_initial, "Operator 'me' allows me to see what was the value of the attribute before it was changed.
*           /     text_initial.
*  ENDMETHOD.                    "method1
*ENDCLASS.                    "example IMPLEMENTATION
*
*
*START-OF-SELECTION.
*  DATA object TYPE REF TO example.
*  CREATE OBJECT object.
*  CALL METHOD object->method1.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*SEVENTH ABAP OOP USING PROGRAM -> exercising. INHERITANCE.
*---------------------------------------------------------------------------------------------------------------------------------

*CLASS warrior DEFINITION.
*  PUBLIC SECTION.
*    DATA: warrior_message(45) VALUE 'I am a warrior!'.
*    METHODS: warrior_method.
*ENDCLASS.                    "warrior DEFINITION

*----------------------------------------------------------------------*
*       CLASS axeman DEFINITION
*----------------------------------------------------------------------*
*
*----------------------------------------------------------------------*
*CLASS axeman DEFINITION INHERITING FROM warrior.
*  PUBLIC SECTION.
*    METHODS: axeman_method.
*ENDCLASS.                    "axeman DEFINITION
*
**----------------------------------------------------------------------*
**       CLASS warrior IMPLEMENTATION
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
*CLASS warrior IMPLEMENTATION.
*  METHOD warrior_method.
*    WRITE: / warrior_message.
*  ENDMETHOD.                    "warrior
*ENDCLASS.                    "warrior IMPLEMENTATION
*
**----------------------------------------------------------------------*
**       CLASS axeman IMPLEMENTATION
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
*CLASS axeman IMPLEMENTATION.
*  METHOD: axeman_method.
*    WRITE: / 'From the axeman class: ', warrior_message. "Axeman reaches for a variable it never defined itself but which is defined in Warrior (its parent class).
*  ENDMETHOD.                    "axeman
*ENDCLASS.                    "axeman IMPLEMENTATION
*
*START-OF-SELECTION.
*  DATA: warrior TYPE REF TO warrior,
*        axeman TYPE REF TO axeman.
*  CREATE OBJECT: warrior, axeman.
*  CALL METHOD: warrior->warrior_method,
*               axeman->axeman_method. "Axeman's method reaches for the attribute defined in Warrior.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*SEVENTH ABAP OOP USING PROGRAM -> exercising. INHERITANCE.
*---------------------------------------------------------------------------------------------------------------------------------



*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*FIELD-SYMBOLS.
*---------------------------------------------------------------------------------------------------------------------------------
*Field-symbol is a placeholder for a data object which points to the value present at the memory address of a data object. The field-symbol does not reserve any
*physical memory itself when declared. It only points to a data object at run time. There are two types: typed field-symbols and generic field-symbols.

*--------------------------------------------
*FIELD-SYMBOLS AS A REPLACEMENT FOR WORK AREA PROGRAM.
*--------------------------------------------
*I can declare a field-symbol of type any structure, which can be used while looping through the internal table.
*DATA: it_mara TYPE STANDARD TABLE OF mara.
*FIELD-SYMBOLS: <fs_mara> TYPE mara.
*
*SELECT * FROM mara INTO TABLE it_mara UP TO 50 ROWS. "Fetching the data into the internal table.
*
*LOOP AT it_mara ASSIGNING <fs_mara>. "Assiging what's in the internal table into the field-symbol. I think that with field-symbols, I always have to ASSIGN stuff to it...
*  IF <fs_mara> IS ASSIGNED. "I think this might be generally redundant. Maybe just to be one the safe side?
*    WRITE: / <fs_mara>-matnr, "Fields from the MARA table.
*             <fs_mara>-mtart,
*             <fs_mara>-meins.
*  ENDIF.
*ENDLOOP.
*If I change any field of structure in field-symbol, the corresponding field in the internal table will get updated. MODIFY statement is not required (it would be if
*I was using work area instead of field-symbols. Work area stores a copy of the internal table row, whereas field-symbol references the internal table row directly.
*Processing the internal table with field-symbols is thus faster than using work area.



*--------------------------------------------
*APPENDING TO INTERNAL TABLE PROGRAM.
*--------------------------------------------
*DATA it_mara TYPE  STANDARD TABLE OF mara.
*FIELD-SYMBOLS: <fs_mara> TYPE mara.
*
*APPEND INITIAL LINE TO it_mara ASSIGNING <fs_mara>.
*IF <fs_mara> IS ASSIGNED.
*  <fs_mara>-matnr = 'MAT1'.
*  <fs_mara>-matkl = '001'.
*  UNASSIGN <fs_mara>.
*ENDIF.
*
*APPEND INITIAL LINE TO it_mara ASSIGNING <fs_mara>.
*IF <fs_mara> IS ASSIGNED.
*  <fs_mara>-matnr = 'MAT2'.
*  <fs_mara>-matkl = '001'.
*  UNASSIGN <fs_mara>.
*ENDIF.
**-----CALLING THE FUNCTION-----
*CALL FUNCTION 'SRTT_TABLE_DISPLAY' "I am calling this function to be able to WRITE the content of the table to a screen!
*  EXPORTING
*    table               = 'MARA'"I think that's the table we're basing our internal table on.
**   IV_TITLE            =
*  tables
*    table_content       = it_mara. "This is what we want written. The content of what we want displayed.
** EXCEPTIONS
**   INVALID_INPUT       = 1
**   OTHERS              = 2
*          .
*IF sy-subrc <> 0.
** Implement suitable error handling here
*ENDIF.
**-----FINISHING THE FUNCTION-----


*I should always perform a check on a field-symbol seeing if it is indeed assigned (IF <fs_mara> IS ASSIGNED.) before doing
*any operation in order to avoid a 'short dump'. After doing the opertaion, I should also unassign the field-symbol.

*READ TABLE it_mara ASSIGNING <fs_mara> WITH KEY matnr = 'MAT1'. "This should technically read the table as well, but tough luck, IT DOSN'T!

*----------------------------
*TYPED FIELD SYMBOLS' PROGRAM
*----------------------------
*DATA var TYPE i VALUE 2.
*FIELD-SYMBOLS: <fs_num> TYPE i. "My field-symbol assumes a certain type of data.
*ASSIGN var TO <fs_num>. "My field-symbol assumes the concrete value of the variable var.
*WRITE: / <fs_num>. "My field-symbol has now the value of 2, because it was assigned the value of var which initially had 2 as its value.
*<fs_num> = 4.
*WRITE: / var. "var now has the value of 4 because my field-symbol is a placeholder for it, a representation of it. If my field-symbols chagnes so does the value it points at.

*Typed field-symbols can only point to the data object of a specified type. Changes done to the field-symbol will be also done to the variable which was ASSIGNed to my field-symbol.
*----------------------------
*GENERIC FIELD SYMBOLS' - TYPE ANY PROGRAM
*----------------------------
*Dynamic programming is usually implemented using generic field-symbols. The most commonly used generic types are
*TYPE ANY and TYPE ANY TABLE.

*FIELD-SYMBOLS: <fs_str> TYPE any.
*FIELD-SYMBOLS: <fs_data> TYPE any.
*
**I can assign any data object to the TYPE ANY and any internal table to TYPE TABLE ANY.
*
*DATA lw_mara TYPE mara.
*ASSIGN lw_mara TO <fs_str>. "Assigning internal table's data to <fs_str> which is of whatever type I want it to be.
*IF <fs_str> IS ASSIGNED.
*  ASSIGN COMPONENT 'MATNR' OF STRUCTURE <fs_str> TO <fs_data>.
**Above I am adding component named 'matnr' from the structure <fs_str> to <fs_data>. This is done in such a stiff manner, because
**I cannot directy access the field <fs_str>-matnr... It's declared at runtime!
**By doing it that way, I am creating an abstraction, a workaround - I am assigning a component named MATNR of <fs_str> (which is basically
**lw_mara which is like mara) to <fs_data> and then, below, I am giving the value of MAT001 to <fs_data>... so to a field named MATNR in
**<fs_str> because field-symbols are references! I am thus assigning a value to a field that I cannot access yet because it's done decalred
**yet (will be at runtime)!
*  IF <fs_data> IS ASSIGNED.
*    <fs_data> = 'MAT001'.
*    UNASSIGN <fs_data>. "Also a supposedely regular thing to do. Clean code thing maybe?
*  ENDIF.
*  UNASSIGN <fs_str>.
*ENDIF.
*
**After I've assigned lw_mara to <fs_str>, I cannot directly use '-' operator on the field-symbol to access mara's
**structure (e.g. <fs_str>-matnr), because that would cause a syntax error - and that is because field-symbol type is
**declared only at runtime, not at compile time! Which means that until then... <fs_str> does not have the content of what's
**been assigned to it?
**After all that, the above code will make lw_mara-matnr have the value of 'MAT001', which is kewl.

*----------------------------
*GENERIC FIELD SYMBOLS' - TYPE ANY TABLE PROGRAM
*----------------------------
*I can assign any internal table to such a symbol.

*FIELD-SYMBOLS: <fs_tab> TYPE ANY TABLE. "Remember, field-symbols are references to data objects.
*FIELD-SYMBOLS: <fs_str> TYPE any.
*FIELD-SYMBOLS: <fs_data> TYPE any.
*
*DATA: lt_mara TYPE STANDARD TABLE OF mara. "Creating an internal table based on database table mara.
*
*SELECT * FROM mara INTO TABLE lt_mara UP TO 30 ROWS. "Populating the internal table with records from mara... which means that declaring lt_mara there makes the internal table look LIKE (structure) mara, not have the values.
*ASSIGN lt_mara TO <fs_tab>. "Making <fs_tab> refer to lt_mara.
*
*LOOP AT <fs_tab> ASSIGNING <fs_str>."Looping through lt_mara (referenced by <fs_tab>!) ASSIGNing it's records (one record per iteration of the loop) to <fs_str>. Which means that <fs_str> is a reference to a single record.
*  IF <fs_str> IS ASSIGNED.
*    ASSIGN COMPONENT 'MATKL' OF STRUCTURE <fs_str> TO <fs_data>. "ASSIGN COMPONENT "which looks like 'MATKL' from <fs_str> (which is a reference to a single record of lt_mara) to <fs_data>.
**So <fs_data> is now a refernce to a component (field) named 'MATKL' taken from <fs_str> which is a reference to a single record from <fs_tab> which is lt_mara.
*    IF <fs_data> IS ASSIGNED.
*      IF <fs_data> EQ '01'. "If that field equals '01' then do stuff...
*************DO STUFF************
*      ENDIF.
*      UNASSIGN <fs_data>.
*    ENDIF.
*  ENDIF.
*ENDLOOP.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM
*---------------------------------------------------------------------------------------------------------------------------------

*TABLES: zbm_order.
*
*PARAMETERS: p_order TYPE zbm_order-order_num, "Variable names has to be maximum of 8 characters' length.
*            p_mat TYPE zbm_order-material.
*
*SELECT * FROM zbm_order WHERE order_num = p_order AND material = p_mat.
*  WRITE: zbm_order-order_num, zbm_order-creation_date, 25(20) zbm_order-cust_name, 44 zbm_order-item.
*ENDSELECT.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> PURCHASE ORDER TABLE -> TWO PRIMARY KEYS
*---------------------------------------------------------------------------------------------------------------------------------
*The table had two columns set as Primary Keys, it is then called a Composite Primary Key.
*TABLES: zbm_porder.
*
*PARAMETERS: p_order TYPE zbm_porder-order_num,
*            p_mat   TYPE zbm_porder-material.
*
*SELECT * FROM zbm_porder WHERE order_num = p_order AND material = p_mat.
*  WRITE: / zbm_porder-order_num, zbm_porder-line, zbm_porder-material.
*ENDSELECT.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> MATERIAL MASTER TABLE -> MARA
*---------------------------------------------------------------------------------------------------------------------------------

*MARA is a standard SAP table and contains most of the field related to material master. Material master is a base table that
*stores all the materials. There are other tables associated with materials, but MARA is the base table which stores all the materials.
*There is a parameter called MATERIAL GROUP used to manage the materials (e.g. electronics).

*TABLES: mara. "I don't need ALL the columns of mara (245). There is a lot of data that I might not need, I just want some of it.
*When I am declaring the  TABLES mara and then creating a SELECT * FROM mara WHERE xyz, I would receive all 245 columns selected.
*This requires an optimization. I don't need all these fields... I only need three fields - matnr, ersda and matkl.
*So, instead of declaring the entire table (which will in turn create a work area internally...) - I am declaring a TYPES statement.
*Thus I am creating a structure that will contain whatever number of fields I want it to, e.g. just 3.
*A structure all by itself is no good since it cannot hold any data, it's just a definition of a structure. It's a blueprint for something
*that WILL hold the data.
*The actual data is held by an internal table.
*
*TYPES: BEGIN OF ty_mara, "TYPE declares a structure. It cannot hold any data yet. It's ONLY a structure. In order for it to hold the data...
*                matnr TYPE matnr, "... I have to DECLARE it using a DATA statement!
*                ersda TYPE ersda,
*                matkl TYPE matkl,
*  END OF ty_mara.
*
**Below I am creating an internal table which is of the type of previously declared structure ty_mara (it has the mentioned columns).
**Internal table is a table in memory which can hold any number of records.
*DATA: it_mara TYPE TABLE OF ty_mara, "This is a "grid" - it can contain any number of rows.
*      wa_mara TYPE ty_mara. "It's exactly the same in structure as it_mara, but it only has a single row.
*
*PARAMETERS: p_matkl TYPE matkl.
*
*SELECT matnr ersda matkl FROM mara INTO TABLE it_mara WHERE matkl = p_matkl.
**If I leave the statement as "INTO mara", it says I cannot use the internal table as a work area. Which means that
**INTO xyz means getting that data into a work_area.
*  LOOP AT it_mara INTO wa_mara. "By that, I am grabbing a single record.
*    WRITE: / wa_mara-matnr, wa_mara-ersda, wa_mara-matkl. "I need to specify WHAT matnr, ersda and matkl I want. And they are already assigned to the work_area.
*  ENDLOOP.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> DIFFERENT LANGUAGES -> JOINING TABLES (INNER JOIN)
*---------------------------------------------------------------------------------------------------------------------------------
*The table MAKT contains the descriptions of all the materials in different languages are stored. I need data from at least two
*tables... e.g. matnr and matkl from mara as well as description and language from makt.
*TABLE JOIN is used.
*I need to make sure there is a common field between two tables (like Primary Key... really?) - when the join is joined (xD), SAP
*internally creates a "complicated data set" called Cartesian Product... which means data combined from both tables. All columns
*are combined. Then I have that huge piece of data from which I can choose stuff.
*Internal tables come in handy here... If I just go TABLES: MARA. and SELCT... - it's a huge waste of memory (using just TABLES: MARA
*is already a waste). Internal tables allow me to choose just the fields I require so they make that process very efficient.
*I can just e.g. four tables. Then I use SELECT *... without an internal table, the system "goes crazy".

*TYPES : BEGIN OF ty_mara,
*              matnr TYPE matnr,
*              matkl TYPE matkl,
*              spras TYPE spras,
*              maktx TYPE maktx,
*  END OF ty_mara.
*
*DATA: it_mara TYPE TABLE OF ty_mara,
*      wa_mara TYPE ty_mara.
*
*PARAMETERS: p_matnr TYPE matnr,
*            p_spras TYPE spras.
*
**Below I am choosing four fields spread across multiple tables. So I am doing an INNER JOIN!
*SELECT mara~matnr mara~matkl makt~spras makt~maktx
*  FROM mara AS mara INNER JOIN makt AS makt "AS -> an alias.
*  ON mara~matnr = makt~matnr "The common field of all tables, I am joining the tables ON this field (by it/thanks to it/through it). These are the common columns.
*  INTO TABLE it_mara "Into my beautiful internal table.
*  WHERE mara~matnr = p_matnr "These and below is the narrowing of the selection...
*  AND makt~spras = p_spras. "...Which basically means I want to join matnr, matkl, spras and maktx from two tables, so join these tables
*"on their common column which is matnr, put the result into my internal table and do all of these only for these
*"records that meet my criteria, so where mara in matnr column has a record with the value I provided and makt
*"in spras column has a record with the value I provided.
*LOOP AT it_mara INTO wa_mara.
**Below the fields I want already belong to the work_area because they now belong there. With every loop, my work_area contains and thus
**provides one row of data that exists in it_mara... and it exists there because I put it there via my SELECT above.
*  WRITE: / wa_mara-matnr, wa_mara-matkl, wa_mara-spras, wa_mara-maktx.
*ENDLOOP.
*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> MATERIAL STOCK -> JOINING TABLES (LEFT OUTER JOIN)
*---------------------------------------------------------------------------------------------------------------------------------
*When I want to join two tables and one is missing a row for a particular plant (because MARD is designed in such a way that if there
*is no stock for the plant, there's no row) -> I'd rather use OUTER JOIN, because INNER JOIN will drop everything it gathered so far
*from table MARA if it couldn't find data in table MARD and there's no information at all.
*OUTER JOIN will still return everything that was available and add a null or a zero for what was missing.

*TYPES: BEGIN OF ty_mara,
*          matnr TYPE matnr,
*          werks TYPE werks,
*          lgort TYPE lgort,
*          labst TYPE labst,
*  END OF ty_mara.
*
*DATA: it_mat TYPE TABLE OF ty_mara,
*      wa_mat TYPE ty_mara.
*
*PARAMETERS: p_matnr TYPE matnr.
*
**Looks like SQL requires '~' instead of '-' when specifying the table~column relationship.
*SELECT mara~matnr mard~werks mard~lgort mard~labst
*  FROM mara AS mara LEFT OUTER JOIN mard AS mard
*  ON mara~matnr = mard~matnr
*  INTO TABLE it_mat
*  WHERE mara~matnr = p_matnr.
*
*LOOP AT it_mat INTO wa_mat.
*  WRITE: / wa_mat-matnr, wa_mat-werks, wa_mat-lgort, wa_mat-labst. "Everything taken from MARA and MARD has already been put into it_mat and then, with every loop, is handed by wa_mat. wa_mat holds every new row every loop.
*ENDLOOP.
**There is an error trying to compile the program but the course's author doesn't seem to have it. LGORT must have changed in the meantime.
**Without lgort, it compiles.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> JAPANESE MATERIAL STOCK -> JOINING THREE TABLES (INNER JOIN)
*---------------------------------------------------------------------------------------------------------------------------------
*As I am pulling in more tables into the pool included in my JOIN, the LEFT OUTER JOIN is not recommended as it pulls in more
*rows than are needed.

*TYPES: BEGIN OF ty_mat,
*         matnr TYPE matnr, "This is the material number, my key-field.
*         matkl TYPE matkl, "The material group.
*         spras TYPE spras, "That's the language.
*         maktx TYPE maktx, "The description.
*         werks TYPE werks, "Currency?
*         labst TYPE labst, "The quantity!
*  END OF ty_mat.
*
*DATA: it_mat TYPE TABLE OF ty_mat,
*      wa_mat TYPE ty_mat.
*
*PARAMETERS: p_matnr TYPE matnr,
*            p_spras TYPE spras.
*
*SELECT mara~matnr mara~matkl makt~spras makt~maktx mard~werks mard~labst
*  FROM mara AS mara
*  INNER JOIN makt AS makt ON mara~matnr = makt~matnr
*  INNER JOIN mard AS mard ON mara~matnr = mard~matnr
*  INTO TABLE it_mat
*  WHERE mara~matnr = p_matnr
*  AND makt~spras = p_spras.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> PETE MOXTON'S OOP -> THE SIMPLEST METHODS
*---------------------------------------------------------------------------------------------------------------------------------
*CLASS smith DEFINITION.
*
*  PUBLIC SECTION.
*    DATA: name TYPE c LENGTH 40,
*          age TYPE i,
*          gender TYPE c LENGTH 1.
*    CLASS-DATA: count TYPE i.
*
*    METHODS: setname
*              IMPORTING namein TYPE c, "This means this method takes in a 'namein' as a parameter. It's 'importing' input.
*
*             getname
*              EXPORTING nameout TYPE c,
*
*             setgender
*              CHANGING newgender TYPE c.
*ENDCLASS.                    "smith DEFINITION
*
**----------------------------------------------------------------------*
**       CLASS smith IMPLEMENTATION
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
*CLASS smith IMPLEMENTATION.
*
*  METHOD setname. "In the implementation it's Method, not Methods.
*    name = namein. "This method imports input and sets the data defined in the class definition accordingly. It's basically a simple setter.
*  ENDMETHOD.                    "setname
*
*  METHOD getname.
*    nameout = name. "As in the definition it is EXPORTING data, it means it's 'returning' the parameter nameout... and that parameter that is being 'returned' is data defined in the class definition. So it's basically a simple getter.
*  ENDMETHOD.                    "getname
*
*  METHOD setgender.
*    IF newgender CO 'MF'. "If the parameter being passed into the method contains (CO) 'M' or 'F', then we are setting the data defined in the class deifinition to the parameter being passed into the method.
*      gender  = newgender.
*      newgender = '1'. "Set the returning value to 1, which means the gender was set correctly.
*    ELSE.
*      newgender = '2'. "Means the gender was not set.
*    ENDIF.
*  ENDMETHOD.                    "setgender
*
*ENDCLASS.                    "smith IMPLEMENTATION

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> PETE MOXTON'S OOP -> THE FUNCTIONAL METHOD
*---------------------------------------------------------------------------------------------------------------------------------

*CLASS singingman DEFINITION.
*  PUBLIC SECTION.
*    DATA: status TYPE c.
*
*    METHODS: getstatustext
*        IMPORTING value(statcode) TYPE c
*        RETURNING value(stattext) TYPE string.
*
*ENDCLASS.                    "singingman DEFINITION
*
**----------------------------------------------------------------------*
**       CLASS singingman IMPLEMENTATION
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
*CLASS singingman IMPLEMENTATION.
*  TO BE FINISHED!!!!!!!!!!!!!!!!!!!!
*ENDCLASS.


*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> PETE MOXTON'S OOP -> A CLASS CREATING EXERCISE
*---------------------------------------------------------------------------------------------------------------------------------

*CLASS car DEFINITION.
*  PUBLIC SECTION.
*    CLASS-DATA: numofcars TYPE i. "This is a static attribute! It is... static. Class-wide, amirite? Because calling methods on objects is so last season, kek.
*
**Constructors can also be static.
**-they always need to be in a PUBLIC SECTION,
**-there never is an interface -> I don't use any parameters at all,
**-it can only access static attributes of its class (because if I haven't instantiated an object, there's no data assigned to fields while static attributes are already there).
**Static constructors are executed the first time either an object of a class is created, either a static attribute of a class is used or a static method of a class is used.
*
*    CLASS-METHODS class_constructor.
*
*    METHODS constructor "Constructor is above other methods for visibility, whatever, it's not necessary.
*      IMPORTING "IMPORTING is the only thing a constructor can do. Soooo... like a Java constructor. It's all coming together.
*        make TYPE c "Initializing fields. Speed is not initialized, because I have other methods to decide the speed. Basically, there is no default speed.
*        model TYPE c
*        seat_num TYPE i
*        max_spd TYPE i.
*
*    METHODS: setnumseats IMPORTING newseatnum TYPE i, "The method sets the number of seats. So I am passing said new number of seats the method should set.
*             gofaster    IMPORTING increment  TYPE i EXPORTING result TYPE i,
*             goslower    IMPORTING decrement  TYPE i RETURNING value(result) TYPE i,
*             viewcar.
**The difference between EXPORTING and RETURNING VALUE seems... non-existent. Just two different ways of doing it.
*
*
**Attributes are here so that only the methods of the class can update them. If a calling program wants to access them, it will need to do it by calling the
**methods of this class. So basically simple and obvious encapsulation. It's the same as in Java.
*  PRIVATE SECTION.
*    DATA: make     TYPE c LENGTH 20, "The lengths are whatever, really.
*          model    TYPE c LENGTH 20,
*          seat_num TYPE i,
*          speed    TYPE i,
*          max_spd  TYPE i.
*
*    CLASS-DATA carlog TYPE c LENGTH 40. "My class_constructor uses it!
*
*
**    METHODS: setnumseats, gofaster, goslower.
*ENDCLASS.                    "car DEFINITION
*
**----------------------------------------------------------------------*
**       CLASS car IMPLEMENTATION
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
*CLASS car IMPLEMENTATION.
*
*  METHOD class_constructor.
*    carlog = 'Car class has been used'.
*    WRITE: / carlog.
*  ENDMETHOD.                    "class_constructor
*
**This is just a simple Java-like constructor, it's just shared between DEFINITION and IMPLEMENTATION. In the definition I pass the parameters and here I assign them to 'this' fields.
**If a parameter is called, e.g. make, I'd need to make the assigning look like: make = make. This causes ambiguity. There is an option to just not name parameters I am passing into
**the method the same as the arguments of my class... BUT I still can do things like in Java and I think it's the default solution for ABAP.
**There is a mechanism called SELF REFERENCE.
*  METHOD constructor.
*    me->make = make.
*    me->model = model.
*    me->seat_num = seat_num.
*    me->max_spd = max_spd. "I think that all these 'me->s' are an equivalent to Java's 'this'.
*    numofcars = numofcars + 1. "This is a static field, so each time a new car is created, the overall number of them is incremented.
*  ENDMETHOD.                    "constructor
*
*  METHOD setnumseats.
*    seat_num = newseatnum.
*  ENDMETHOD.                    "setnumseats
*
*  METHOD gofaster. "I am going to declare a local variable to help my calculations (I think it's 'theresult' added to store the value of 'result'! Its structure is a new concept for me - it's 'result = theresult'...
*    IF speed + increment > max_spd.                                                                                               "...which applies the value of 'result' to the 'theresult', not the other way around.
*      speed = max_spd.
*    ELSE.
*      speed = speed + increment.
*    ENDIF.
*    result = speed.
*  ENDMETHOD.                    "gofaster
*
*  METHOD goslower.
*    IF speed - decrement <= 0.
*      speed = 0.
*    ELSE.
*      speed = speed - decrement.
*    ENDIF.
*    result = speed.
*  ENDMETHOD.                    "goslower
*
*  METHOD viewcar. "Both the numeric values down there and the LEFT JUSTIFIED are just for placement of the data being written as the output.
*    WRITE: / 'Make = ', 19 make.
*    WRITE: / 'Model = ', 19 model.
*    WRITE: / 'Number of seats = ', 19 seat_num LEFT-JUSTIFIED.
*    WRITE: / 'Max speed = ', 19 max_spd LEFT-JUSTIFIED.
*    WRITE: / 'Speed = ', 19 speed LEFT-JUSTIFIED.
*  ENDMETHOD.                    "viewcar
*
*ENDCLASS.                    "car IMPLEMENTATION
*
*START-OF-SELECTION. "That's how I tell the system where I want it to start processing my code.
*
*  DATA: theresult TYPE i.
*
*  DATA: car_one TYPE REF TO car,
*        car_two TYPE REF TO car.
*  CREATE OBJECT: car_one "If there's no more code than this, I will get an error... because I made a constructor and it requires me to pass in parameters.
*    EXPORTING "This is how I pass in the parameters that constructor requires me to upon the creation of an object -> EXPORTING -> field -> gib valius.
*      make = 'AUDI'
*      model = 'A4'
*      seat_num = 5
*      max_spd = 120.
*
*  CALL METHOD: car_one->viewcar.
*  ULINE.
*
*  CREATE OBJECT: car_two
*    EXPORTING
*      make = 'BMW'
*      model = '320'
*      seat_num = 5
*      max_spd = 130.
*
*  CALL METHOD: car_two->viewcar.
*  ULINE.
*
**To see if the number of seats change.
*  CALL METHOD: car_one->setnumseats( 8 ).
*  CALL METHOD: car_one->viewcar.
*
**Another way of using the same method.
*  CALL METHOD: car_one->setnumseats( newseatnum = 12 ).
*  CALL METHOD: car_one->viewcar.
*  ULINE.
*
**Playing around with gofaster method.
*  CALL METHOD: car_one->gofaster( EXPORTING increment = 30 IMPORTING result = theresult ). "In here, somehow, 'result = theresult' means that the value of 'result' is stored in 'theresult', not the other way around.
*  CALL METHOD: car_one->viewcar.
*  WRITE: / 'The result of gofaster is:', theresult LEFT-JUSTIFIED.
*  ULINE.
*
**Playing around with the goslower method.
*  CALL METHOD: car_one->goslower( EXPORTING decrement = 10 RECEIVING result = theresult ). "goslower method has RETURNING instead of EXPORTING so it's RECEIVING, not IMPORTING).
*  CALL METHOD: car_one->viewcar.
*  WRITE: / 'The result of goslower is:', theresult LEFT-JUSTIFIED.
*  ULINE.
*
*  WRITE: / 'The number of cars created is:', car=>numofcars.
*  ULINE.
*
**Supposedely the 'Old Way' of calling methods is: CALL METHOD classname=>methodname. and the 'New Way' is: classname=>methodname(). but I do not understand it.
**Methods are called upon objects of classes, not classes and it cannot be applied, to say, constructors (regular or static), because they are... constructors.
**Perhaps it applies only to static methods.
**INSTANCE METHODS USES '->' INSTEAD OF '=>' USED BY STATIC ONES.
*
**If I want to access a static attribute, I do it like that:
**  DATA some_var TYPE i.
**  some_var = car=>numofcars.
**  WRITE: / some_var.
*
**FUNCTIONAL METHOD------------------------------------------------------------------------------
**Basically this:
**CALL METHOD: car_one->goslower( EXPORTING decrement = 10 RECEIVING result = theresult ).
**Is equal to this:
**theresult = car_one->goslower( 10 ).
**The RECEIVING part is traded for assigning the method directly to the predefined variable and that leaves me with a single parameter... so the word EXPORTING can be omitted.
*
*  theresult = car_one->goslower( 3 ).
*  car_one->viewcar( ).
*  WRITE: / 'The result of goslower (functional method) is:', theresult LEFT-JUSTIFIED.
*  ULINE.


*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*ATTEMPTING TO EXTRACT INVOICE DATA FROM VBFA BY REFERENCE NUMBER
*---------------------------------------------------------------------------------------------------------------------------------
*TABLES: vbfa.
*
*TYPES: BEGIN OF ty_vbf,
*  vbeln TYPE vbfa-vbeln,
*  END OF ty_vbf.
*
*DATA: wa_vbf TYPE ty_vbf.
*
*SELECT vbeln
*FROM vbfa
*INTO wa_vbf
*WHERE vbelv = BKPF-XBLNR "VBELV is the reference number in VBFA (Sales Documents Flow) and XBLNR is its corresponding field in BKPF.
*  AND VBTYP_N = 'M' "That's the type of the document. 'M' is for invoices.
*  AND erdat = ( select MAX( erdat )
*                from vbfa
*                where vbelv = BKPF-XBLNR
*                and erdat LE sy-datum ).
*  ENDSELECT.
*
*NRFAKTURYDOWZ = wa_vbf-vbeln. "In SQ02 I needed to assign the output of my code to the field that's about to display the data I am processing.

*---AND I AM BACK HERE AND THAT CRAP AIN'T WORKING NO NO NO WHY WOULD IT FUCK---

*TABLES: vbfa, bkpf.
*
*TYPES: BEGIN OF ty_vbf,
*  vbelv TYPE vbfa-vbelv,
*  END OF ty_vbf.
*
*TYPES: BEGIN OF ty2_vbf,
*  vbeln TYPE vbfa-vbeln,
*  END OF ty2_vbf.
*
*DATA: wa_ini TYPE ty_vbf,   "To hold the initial VBELV.
*      wa_prev TYPE ty_vbf,  "To hold the VBELV within the loop while going 'backwards' for invoices.
*      wa_next TYPE ty2_vbf, "To hold VBELN within the loop while going 'backwards' for invoices.
*      wa_v178 TYPE ty_vbf,  "To hold VBELV for 178% invoices.
*      wa_n178 TYPE ty2_vbf. "To hold VBELN for 178% invoices.
*
*SELECT SINGLE vbelv
*FROM vbfa
*INTO wa_ini
*WHERE vbeln = bkpf-xblnr
*  AND vbeln >= '1000000000'
*  AND vbeln <= '9999999999'.
*
*SELECT SINGLE vbeln
*FROM vbfa
*INTO wa_next
*WHERE vbelv = wa_ini-vbelv.
*
*IF wa_ini-vbelv BETWEEN '1000000000' AND '2999999999'." AND BKPF-BLART = 'WA'.
*
*  IF wa_ini-vbelv BETWEEN '1700000000' AND '1789999999'. "TO NIE DZIA�A
*    SELECT SINGLE vbelv
*    FROM vbfa
*    INTO wa_v178
*    WHERE vbeln = wa_ini-vbelv.
*    SELECT SINGLE vbeln
*      FROM vbfa
*      INTO wa_n178
*      WHERE vbelv = wa_v178-vbelv
*      AND vbeln BETWEEN '1880000000' AND '1889999999'.
*    IF NOT wa_n178 IS INITIAL.
*      WRITE: / wa_n178-vbeln.
*    ELSE.
*      WRITE: / ''.
*    ENDIF.
*  ENDIF.
*  WRITE: / wa_ini-vbelv.
*
*ELSEIF wa_next-vbeln BETWEEN '1000000000' AND '2999999999'." AND BKPF-BLART = 'WA'.
*  IF wa_next-vbeln BETWEEN '1700000000' AND '1789999999'.
*    SELECT SINGLE vbelv
*    FROM vbfa
*    INTO wa_v178
*    WHERE vbeln = wa_next-vbeln.
*    SELECT SINGLE vbeln
*    FROM vbfa
*    INTO wa_n178
*    WHERE vbelv = wa_v178-vbelv
*    AND vbeln BETWEEN '1880000000' AND '1889999999'.
*    IF NOT wa_n178 IS INITIAL.
*      WRITE: / wa_n178-vbeln.
*    ELSE.
*      WRITE: / ''.
*    ENDIF.
*  ENDIF.
*  WRITE: / wa_next-vbeln.
*
*ELSE.
*  DO 10 TIMES.
*    SELECT SINGLE vbelv
*    FROM  vbfa
*    INTO  wa_prev
*    WHERE vbeln = wa_ini-vbelv.
*    IF wa_prev-vbelv BETWEEN '1000000000' AND '2999999999'." AND BKPF-BLART = 'WA'.
*      IF wa_ini-vbelv BETWEEN '1700000000' AND '1789999999'.
*        SELECT SINGLE vbelv
*          FROM vbfa
*          INTO wa_v178
*          WHERE vbeln = wa_ini-vbelv.
*        SELECT SINGLE vbeln
*        FROM vbfa
*        INTO wa_n178
*        WHERE vbelv = wa_v178-vbelv
*        AND vbeln BETWEEN '1880000000' AND '1889999999'.
*        IF NOT wa_n178 IS INITIAL.
*          WRITE: / wa_n178-vbeln.
*        ELSE.
*          WRITE: / ''.
*        ENDIF.
*      ENDIF.
*      WRITE: / wa_prev-vbelv.
*    ENDIF.
*
*    wa_ini-vbelv = wa_prev-vbelv.
*    CLEAR wa_prev.
*    CLEAR wa_next.
*  ENDDO.
*ENDIF.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*TRYING NOT TO DIE
*---------------------------------------------------------------------------------------------------------------------------------
*TABLES: likp, knb1.
*
*TYPES: BEGIN OF ty_why,
*  ERNAM TYPE knb1-ERNAM,
*  END OF ty_why.
*
*DATA: omfg TYPE ty_why.
*DATA: ld_kunnr TYPE knb1-kunnr.
*
*SELECT SINGLE ERNAM
*  INTO omfg
*  FROM knb1
*  WHERE ld_kunnr = 'K00140005'.
*
*WRITE: omfg-ernam.

*DATA: tu TYPE c LENGTH 10.
*
*select single kunnr into tu from knb1
*       where kunnr = 'K00140005'.
*
*WRITE: / tu.

*TABLES: knb1, likp.
*
*TYPES: BEGIN OF ty_knb,
*  kunnr TYPE knb1-kunnr,
*  END OF ty_knb.
*
*DATA: wa_knb TYPE ty_knb.
*
*SELECT SINGLE kunnr
*FROM knb1
*INTO wa_knb
*WHERE kunnr = 'K00140005'.
*
*WRITE: / wa_knb-kunnr.

*'K94012000' -> TO JEST W KNB1 NA BOD -> NR TELEFONU, MOG� TUTAJ TESTOWA� <3

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> PETE MOXTON'S ABAP (but in reality, exercising internal tables' handling)
*---------------------------------------------------------------------------------------------------------------------------------
*TABLES: zpokemon. "'Tables' keyword creates a table structure in memory based on the structure defined in ABAP dictionary.
**                  It will contains all records created.
*
*TYPES: BEGIN OF it_pok, "Declaration of structure...
*  employee TYPE zpokemon-employee,
*  surname TYPE zpokemon-surname,
*  forename TYPE zpokemon-forename,
*  title TYPE zpokemon-title,
*  dob TYPE zpokemon-dob,
*  END OF it_pok.
*
*DATA: t_pok TYPE STANDARD TABLE OF it_pok, "Declaration of data types...
*      s_pok TYPE it_pok.
*
*SELECT * FROM zpokemon INTO CORRESPONDING FIELDS OF TABLE t_pok. "Populating the table...
*
*LOOP AT t_pok INTO s_pok. "Loop at the populated table and into WA.
*  WRITE: / s_pok-forename,
*           s_pok-dob.
*ENDLOOP.
*******************************************************************************************************************************************
**If the LINE-SIZE is set to a value lower than the number of characters required to display all the output, the content of the line is cut.
*SELECT * FROM zpokemon.
*  WRITE zpokemon.
*  ENDSELECT.
*******************************************************************************************************************************************

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> PETE MOXTON'S ABAP -> VARIABLES
*---------------------------------------------------------------------------------------------------------------------------------
*A field is a temporary area of memory I can assign a name to and reference in my programs.
*A variable is a field whose value change during the program execution. Its name must start with a letter, 30 chars is the max size, no plus,
*comma, colon, parentheses and no reserved words.
*DATA: integer_one TYPE i,
*      packed_decimal_1 TYPE p DECIMALS 3 VALUE '0.9', "Stores numbers with decimal places. It can have up to 14 decimal places.
*      packed_decimal_2 LIKE packed_decimal_1, "LIKE makes the new variable take on exactly the same properties defined for the other variable.
**So changing packed_decimal_1 also changes packed_decimal_2.
*      packed_decimal_3 LIKE packed_decimal_1.
*
*WRITE packed_decimal_3. "When printed, shows 0.000???
*WRITE packed_decimal_1. "This shows '0.900' which makes sense because DECIMALS is 3... So perhaps LIKE gives properties, but not values.
*ULINE.
*
*integer_one = 10.
*WRITE integer_one.
*ADD 7 TO integer_one. "Lol, this works.
*WRITE integer_one.
*MULTIPLY integer_one BY 2.
*WRITE integer_one.



*TABLES zpokemon.
*
*DATA mychar(10) TYPE c. "(10) sets the length of the string.
*
*DATA mychar2. "The default length is one character... And the character field is the default type used by ABAP when declaring a field so I don't even need to declare the type. It's a c!
*              "This is the same as DATA mychar2(1) TYPE c.
*
*"DATA zpokemon(40) TYPE c. IS THE SAME AS DATA zpokemon LIKE ZPOKEMON-SURNAME. Because the surname is a CHAR with the length of 40.
*
*DATA stuff TYPE n. "NUMC -> 'number data type'. It is treated just like a character type, but only numeric characters are allowed. When data is moved in to the field, they are automatically
*                   "right-aligned just like a normal numeric type field. It's useful when I want a number but no plans for performing any calculations.
*                   "The initial value of this field is 0, not a space like a character's!
*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> PETE MOXTON'S ABAP -> CONVERSION RULES
*---------------------------------------------------------------------------------------------------------------------------------

*DATA: number_one TYPE p DECIMALS 2 VALUE '2',
*      number_two TYPE p DECIMALS 2 VALUE '8',
*      result TYPE i,
*      result2 TYPE p DECIMALS 2.
*
*result = number_one.
*WRITE: / result.
**Result will be 3.
*
*result = number_two.
*WRITE: / result.
**Result will be 5.
*
**************************************************
**Regular division.
*result2 = number_one / number_two.
*WRITE: / result2.
*
**Integer division.
*result2 = number_one DIV number_two. "DIV converts values to integers.
*WRITE: / result2.
*
**Remainder division.
*result2 = number_one MOD number_two. "Modulo in theory, but if the second value is higher than the previous one, it just gives the first value???
*WRITE: / result2.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> PETE MOXTON'S ABAP -> OPERATIONS ON CHARACTER STRINGS
*---------------------------------------------------------------------------------------------------------------------------------
**CONCATENATE----------------------------------------
*DATA: title(15)         TYPE c VALUE 'High King',
*      forename(40)      TYPE c VALUE 'Rasta',
*      surname(40)       TYPE c VALUE 'Khan',
*      sep, "This is the separator field. No length or type are declared, so default ones are used! These are (1) and C!
*      destination1(200) TYPE c.
*CONCATENATE title forename surname INTO destination1 SEPARATED BY sep.
**First, I decide what I want concatenated and then into what. I can separate the incoming values by whatever I deem fit.
**If the sum of lengths of concatenated fields is larger than the number of destination1's available characters -> it will be truncated.
**I should be using string data type for it. It can hold over 65.000 characters.
*WRITE destination1.
**Program some! <3 -> programmed some! <3
*ULINE.
*
*
*
*
*
**CONDENSE----------------------------------------
**Removes leading and closing blanks characters. All directly consecutive blanks are all replaced by exactly one space character.
**If NO-GAPS additions is used -> removes all blank spaces.
*DATA: spaced_name(50) TYPE c VALUE ' Hand    of     Argus     Halasibel '. "Without specifying the length, it won't print it!
*WRITE: / spaced_name. "No changes.
*ULINE.
*CONDENSE spaced_name.
*WRITE: / spaced_name. "Simple CONDENSE.
*ULINE.
*CONDENSE spaced_name NO-GAPS.
*WRITE: spaced_name. "No blanks.
*ULINE.
*
*
*
*
*
**FINDING THE LENGTH OF A STRING----------------------------------------
*DATA: len TYPE i. "To hold the length of a string.
*len = strlen( surname ). "strln is a function, not a statement. So basically string.length()
*WRITE: 'The length of the surname is ', len.
*ULINE.
*
*
*
*
*
**REPLACE----------------------------------------
*DATA full_name(40). "No type defined, so this is the default type - c!
*full_name = 'Corsair, King Castamir'.
*WRITE full_name.
*ULINE.
*REPLACE ',' WITH '' INTO full_name. "This replaces only the first comma!
*WRITE full_name.
*ULINE.
*
**I can replace all occurences of a thing:
*DATA: name1(20). "At first, I didn't add here the length and so the data element had the value of 'A'.
*name1 = 'Ash, Ketchum,'.
*WRITE name1.
*ULINE.
*REPLACE ',' WITH '' INTO name1. "The second comma remains.
*REPLACE ALL OCCURRENCES OF ',' IN name1 WITH ''.
*WRITE name1. "Both commas are removed.
*ULINE.
*
*
*
*
*
**SEARCH----------------------------------------
**... for specific characters.
**I am not specifying a variable here to hold any result. Instead, two system variables are used:
**1) sy-subrc -> identifies whether the search was successful or not.
**2) sy_fdpos -> if the search was successful, this variable is set to the position of the character string I am searching for
**in another_name.
*DATA another_name(30) TYPE c VALUE 'Herumor the Black Dread'.
*
*WRITE: 'Searching: Herumor the Black Dread'.
*SKIP.
*
**Blank spaces are ignored.
*SEARCH another_name FOR 'Herumor       '.
*WRITE: / 'Searching for "Herumor       " ...'.
*WRITE: / 'sy-subrc: ', sy-subrc, / 'sy-fdpos: ', sy-fdpos.
*ULINE.
*
**Blank spaces are taken into account.
*SEARCH another_name FOR '.Herumor'. "NOTE <-- this makes no sense at all. This isn't any actual functionality that tells ABAP to take blanks into consideration. It treats points like regular characters.
*                                    "Even '.Herumor' does not work, so this point literally does nothing.
*WRITE: / 'Searching for ".Herumor      ." ...'.
*WRITE: / 'sy-subrc: ', sy-subrc, / 'sy-fdpos: ', sy-fdpos.
*ULINE.
*
**Wild card search -> ending.
*SEARCH another_name FOR '*ead'.
*WRITE: / 'Searching for "*ead" ...'.
*WRITE: / 'sy-subrc: ', sy-subrc, / 'sy-fdpos: ', sy-fdpos. "Gives the index of 18 because the index of the word '*ead' is a part of starts at 18th index.
*ULINE.
*
**Wild card search -> beginning.
*SEARCH another_name FOR 'He*'.
*WRITE: / 'Searching for "Bla*" ...'.
*WRITE: / 'sy-subrc: ', sy-subrc, / 'sy-fdpos: ', sy-fdpos. "SAME.
*ULINE.
**Wild cards show the starting index of the word that contains the sought for value. Blank spaces have indexes too. So both 'He*' and '*or' will give sy-fdpos = 0, because they are both parts of
**the word 'Herumor' which starts after the index 0.
*
*
*
*
*
**SHIFT----------------------------------------
**Allows me to move the content of the character string left or right character by character.
*DATA: emp_num(10) TYPE c VALUE '0000654321'. "When I didn't specify the length of C, it was set to default 1... and the result was 1?
*SHIFT emp_num LEFT DELETING LEADING '0'.
*WRITE: / emp_num.
*ULINE.
*
*SHIFT emp_num. "The output here will be '54321', because previously I deleted the 0s and the defult shift is by 1. So 6 gets yeeted.
*WRITE: / emp_num.
*ULINE.
*
*SHIFT emp_num CIRCULAR. "Shifts the string by the default 1, but does not yeet 5 out (6 got yeeted out before), but yeets it to the other side of the string.
*WRITE: / emp_num.       "So the result is '4321     5'. The blanks are there because it's still of the length 10.
*ULINE.
**I can always use -> CONDENSE emp_num NO-GAPS. -> if I want to remove the blank spaces!
*WRITE: / emp_num.
*ULINE.
*
*
*
*
*
**SPLIT----------------------------------------
*DATA: mystring(30) TYPE c,
*      a1(10)       TYPE c,
*      a2(10)       TYPE c,
*      a3(10)       TYPE c,
*      sep2(2)      TYPE c VALUE '**'.
*
*mystring = ' 1234** ABCD **6789'.
*WRITE: / mystring.
*ULINE.
*SKIP.
*
*SPLIT mystring AT sep2 INTO a1 a2 a3. "This means -> SPLIT the provided string AT the position where you find whatever value 'sep2' holds INTO the following data elements.
*WRITE: / a1.
*WRITE:/  a2. "Retains the blank space before it, as only '**' are removed.
*WRITE: / a3. "SAME.
*ULINE.
*SKIP.
*
*DATA: mystring2(30) TYPE c.
*
*mystring2 = 'looool**omg **wtf**rofl'.
*WRITE mystring2.
*ULINE.
*SKIP.
*
*SPLIT mystring2 AT sep2 INTO a1 a2 a3. "SPLIT will try to divide the string into four pieces, because there are three occurences of its separator within the string.
*                                       "Since there are only three fields provided, the remainder (the one that would go into the fourth) will be assigned to the last
*                                       "field provided, so a3.
*WRITE: / a1.
*WRITE:/  a2.
*WRITE: / a3.
*ULINE.
*SKIP.
**If the separator is not found at all within the string, the entirety of the string will be moved to the first of the provided fields that were to receive the pieces of the string!
*
*
*
*
*
**SUB-FIELDS----------------------------------------
**Used to refer to specific characters within the field - "processing sub-fields". There is no SUB-FIELD keyword/function. The syntax of 'string+6(2)' is what makes SUB-FIELD operations.
*DATA: int_telephone_num(17) TYPE c,
*      country_code(3)       TYPE c,
*      telephone_num(14)    TYPE c.
*
*int_telephone_num = '+44-(0)207-123456'.
*WRITE: / int_telephone_num.
*SKIP.
*
*country_code = int_telephone_num(3). "country_code assumes the value of the first three characters of int_telephone_num.
*
*telephone_num = int_telephone_num+4(13). "telephone_num assumes the value of the 13 characters of int_telephone_num and their count begins after the 4th character.
*
*WRITE: / 'country_code: ', country_code.
*WRITE: / 'telephone_num: ', telephone_num.
*
*country_code+1(2) = '01'.
*
*WRITE: / 'country_code: ', country_code.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> PETE MOXTON'S ABAP -> DATE AND TIME FIELDS
*---------------------------------------------------------------------------------------------------------------------------------
**Date and time fields are NOT defined as numeric data types, but character data types. They are characeter strings that can be used in calculations. It's possible
**thanks to automatic data types' conversions.
*DATA: my_date TYPE d. "D is always 8 characters -> first four a year, next two a month and the last two a day. Much like sy-datum then. If I do not specify the value, defaults to 0 (00000000).
*DATA: my_date2 LIKE sy-datum. "I can use LIKE if I already know a date data type and want to copy its structure.
*
**Time fields are 6 character long -> HHMMSS (default 000000).
*DATA: my_time TYPE t.
*DATA my_time2 LIKE sy-uzeit. "System time, like sy-datum being system date.
*
**Both my_date2 and my_time2 are all 0s, because the data types are LIKE them (structure-wise), they do not assume their values.
*WRITE: / my_date.
*ULINE.
*WRITE: / my_date2.
*ULINE.
*WRITE: / my_time.
*ULINE.
*WRITE: / my_time2.
*ULINE.
*
**Below will be displayed as '16.05.1989' because WRITE applies its own formatting which is associated with my user logon.
*my_date = '19890516'.
*WRITE: / my_date.
*ULINE.
*
*
*
**CALCULATIONS WITH DATE FIELDS----------------------------------------
*DATA: empl_sdate TYPE d,
*      todays_date TYPE d,
*      length_of_service TYPE i.
*
*empl_sdate = '20210607'.
*todays_date = sy-datum.
*length_of_service = todays_date - empl_sdate. "On 23.10.2021 I worked for CEDC for 138 days!
*WRITE: length_of_service.
*ULINE.
*
***********************************
*
*DATA: days_count TYPE i,
*      future_date TYPE d.
*
*days_count = 20.
*future_date = todays_date + days_count. "The date is calculated correctly just by adding an integer (which here represents days) <3
*WRITE: future_date.
*ULINE.
*
***********************************
*
**Subfield ->I can change the date like that to, say, represent the 20th of the current month instead of an actual date.
*todays_date = sy-datum.
*todays_date+6(2) = '20'.
*WRITE todays_date.
*ULINE.
*
**Subtracking the value -> e.g. choosing the last day of the previous month.
*todays_date = sy-datum.
*todays_date+6(2) = '01'. "Set the current month's day to the first...
*todays_date = todays_date - 1.
*WRITE todays_date.
*ULINE.
*
*
*
**CALCULATIONS WITH TIME FIELDS----------------------------------------
*DATA: clock_in TYPE t,
*      clock_out TYPE t,
*      seconds_diff TYPE i,
*      minutes_diff TYPE i,
*      hours_diff TYPE p DECIMALS 2.
*
*clock_in = '073000'. "This is 07:30:00 (HHMMSS).
*clock_out = '160000'.
*
**SECONDS:
*seconds_diff = clock_out - clock_in.
*WRITE: 'Clock-in time is: ', clock_in, 'Clock-out time is: ', clock_out.
*WRITE: / 'The time spent in seconds is: ', seconds_diff.
*
**MINUTES:
*minutes_diff = seconds_diff / 60.
*WRITE: / 'The time spent in minutes is: ', minutes_diff.
*
**HOURS:
*hours_diff = minutes_diff / 60.
*WRITE: / 'The time spent in hours is: ', hours_diff.

*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> PETE MOXTON'S ABAP -> QUANTITY AND CURRENCY
*---------------------------------------------------------------------------------------------------------------------------------
**Treated just like pack number fields (p). They need thus be declared as such...
**But it may be better to associate my fields with those already existing in ABAP dictionary. So LIKE will be used.
*
*TABLES: zpokemon. "I need this declaration here because I will be selecting data from it via a SELECT.
*
*DATA: my_salary      LIKE zpokemon-salary, "ABAP will keep my field's and my table's data type of salary in sync.
*                                           "There are two aspects to it: a number of decimals places and the associated currency or quantity fields.
*
*      tax_amount     LIKE zpokemon-salary, "This is also a currency with two decimal places so it can reference the same ABAP dictionary field.
*      net_pay        LIKE zpokemon-salary,
*      tax_percentage TYPE p DECIMALS 2.
*
*tax_percentage = '0.20'. "20% tax rate.
*
*SELECT * FROM zpokemon.
*  WRITE: / 'Surname: ', zpokemon-surname, 'Salary: ', zpokemon-salary, zpokemon-ecurrency.
*  tax_amount = tax_percentage * zpokemon-salary.
*  net_pay = zpokemon-salary - tax_amount.
*  WRITE: / 'Tax amount is: ', tax_amount, zpokemon-ecurrency,
*           'Net pay is: ', net_pay, zpokemon-ecurrency.
*  ULINE.
*ENDSELECT.
*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> OPEN SQL
*---------------------------------------------------------------------------------------------------------------------------------
**Pete wants me to get into the habit of checking whether the action I've been executing has been executed successfully. Sy-subrc will come in handy.
*
*
*
**INSERT----------------------------------------
*DATA: wa_zpokemon LIKE zpokemon. "WA is a record structure, not a table structure -> stores one record.
*
*wa_zpokemon-EMPLOYEE = '80000'.
*wa_zpokemon-SURNAME = 'Taha'.
*wa_zpokemon-FORENAME = 'Justinia'.
*wa_zpokemon-TITLE = 'Ms'.
*wa_zpokemon-DOB = '20191023'.
*wa_zpokemon-INITIALS = 'OS'.
*wa_zpokemon-GENDER = 'N'.
*wa_zpokemon-SALARY = '23525'.
*wa_zpokemon-ECURRENCY = 'USD'.
*wa_zpokemon-ZZLOCATION = 'Warsaw'.
*wa_zpokemon-ZZDEPT = 'IT'.
*
*INSERT zpokemon FROM wa_zpokemon. "Literally INSERT INTO zpokemon FROM wa_zpokemon.
*  WRITE: 'INSERT.'.
*IF sy-subrc = 0.
*  WRITE: 'Record inserted correctly. The surname is: ', wa_zpokemon-surname. "It will throw 4, because the record already exists!
*ELSE.
*  WRITE: 'The return code is: ', sy-subrc.
*
*ENDIF.
*ULINE.
*
*
*
**CLEAR----------------------------------------
**Used mainly in loops. Just clear the area to make sure values are not assigned incorrectly.
**I can clear the entire structure or specific fields.
*CLEAR wa_zpokemon. "Not really necessary in this case as I am covering every field anyway and so there won't be any value I would not want
*                   "lingering in any field of the work area structure, but it just seems so elegant!
*
*
*
**UPDATE----------------------------------------
**Allows me to modify one or more existing records within a table.
*wa_zpokemon-EMPLOYEE = '80000'.
*wa_zpokemon-SURNAME = 'Tahar'.
*wa_zpokemon-FORENAME = 'Justinia'.
*wa_zpokemon-TITLE = 'Ms'.
*wa_zpokemon-DOB = '20191023'.
*wa_zpokemon-INITIALS = 'OS'.
*wa_zpokemon-GENDER = 'N'.
*wa_zpokemon-SALARY = '23525'.
*wa_zpokemon-ECURRENCY = 'USD'.
*wa_zpokemon-ZZLOCATION = 'Warsaw'.
*wa_zpokemon-ZZDEPT = 'IT'.
*
*
*UPDATE zpokemon FROM wa_zpokemon.
*  WRITE: 'UPDATE.'.
*IF sy-subrc = 0.
*  WRITE: 'Record updated correctly. The surname is: ', wa_zpokemon-surname.
*ELSE.
*  WRITE: 'The return code is: ', sy-subrc.
*
*ENDIF.
*ULINE.
*
*
*
**MODIFY----------------------------------------
**Like a combination of INSERT and UPDATE - it can be used either to introduce a new record or modify an existing one. When I know I am inserting
**or I know I am updating a record, I should always use INSERT or UPDATE respectively. MODIFY is to be used when my code is to EITHER insert or
**update a record depending on the situation, so when I need a flexible soultion.
*
**MODIFY AS AN UPDATE********************
*wa_zpokemon-EMPLOYEE = '80000'.
*wa_zpokemon-SURNAME = 'Tahari'.
*wa_zpokemon-FORENAME = 'Justinia'.
*wa_zpokemon-TITLE = 'Ms'.
*wa_zpokemon-DOB = '20191023'.
*wa_zpokemon-INITIALS = 'OS'.
*wa_zpokemon-GENDER = 'N'.
*wa_zpokemon-SALARY = '23525'.
*wa_zpokemon-ECURRENCY = 'USD'.
*wa_zpokemon-ZZLOCATION = 'Warsaw'.
*wa_zpokemon-ZZDEPT = 'IT'.
*
*MODIFY zpokemon FROM wa_zpokemon. "When MODIFY is executed, the primary key fields from wa_pokemon will be checked against those records held
*                                 "in the table.
*                                 "If a record exists, it will be UPDATED with the content held in my work area.
*                                 "If a record does not exist, a new one will be INSERTED at the end of the table!
*  WRITE: 'MODIFY.'.
*IF sy-subrc = 0.
*  WRITE: 'Record modified correctly. The surname is: ', wa_zpokemon-surname.
*ELSE.
*  WRITE: 'The return code is: ', sy-subrc.
*
*ENDIF.
*ULINE.
*
**MODIFY AS AN INSERT********************
*
*CLEAR wa_zpokemon.
*
*wa_zpokemon-EMPLOYEE = '333333'.
*wa_zpokemon-SURNAME = 'Hilieandil'.
*wa_zpokemon-FORENAME = 'Nurnirven'.
*wa_zpokemon-TITLE = 'Mr'.
*wa_zpokemon-DOB = '20191023'.
*wa_zpokemon-INITIALS = 'NH'.
*wa_zpokemon-GENDER = 'M'.
*wa_zpokemon-SALARY = '23525'.
*wa_zpokemon-ECURRENCY = 'USD'.
*wa_zpokemon-ZZLOCATION = 'Warsaw'.
*wa_zpokemon-ZZDEPT = 'IT'.
*
*MODIFY zpokemon FROM wa_zpokemon.
*
*WRITE: 'MODIFY.'.
*IF sy-subrc = 0.
*  WRITE: 'Record modified correctly. The surname is: ', wa_zpokemon-surname.
*ELSE.
*  WRITE: 'The return code is: ', sy-subrc.
*
*ENDIF.
*ULINE.
*
*
*
**DELETE----------------------------------------30.10.2021
**It only needs to take into account the Primary Key. I give a primary key and in return receives the removal of the record of said primary key.
**My zpokemon table contains two Primary Keys, but the MANDT (Client) is handled automatically by the system so I don't need to feed my SQL statements
**the MANDT field.
*wa_zpokemon-EMPLOYEE = '80000'.
*
*DELETE zpokemon FROM wa_zpokemon. "Delete a record from zpokemon table that has the employee that equals 80000.
*
*WRITE: 'DELETE.'.
*IF sy-subrc = 0.
*  WRITE: 'Record deleted correctly.'.
*ELSE.
*  WRITE: 'The return code is: ', sy-subrc.
*
*ENDIF.
*ULINE.
*
*
*
**I can delete records WHERE...
**START OF - Insert two exemplary records*******************************************
*
**EXAMPLE EHI
*CLEAR wa_zpokemon.
*wa_zpokemon-EMPLOYEE = '777'.
*wa_zpokemon-SURNAME = 'Oongha'.
*wa_zpokemon-FORENAME = 'Siv'.
*wa_zpokemon-TITLE = 'Ms'.
*wa_zpokemon-DOB = '20191023'.
*wa_zpokemon-INITIALS = 'SO'.
*wa_zpokemon-GENDER = 'F'.
*wa_zpokemon-SALARY = '23525'.
*wa_zpokemon-ECURRENCY = 'USD'.
*wa_zpokemon-ZZLOCATION = 'Warsaw'.
*wa_zpokemon-ZZDEPT = 'IT'.
*INSERT zpokemon FROM wa_zpokemon.
*
*WRITE: 'INSERT example Ehi.'.
*IF sy-subrc = 0.
*  WRITE: 'Ehi in place.'.
*ELSE.
*  WRITE: 'Lol, fail! You got ', sy-subrc, '!'.
*ENDIF.
*ULINE.
*
**EXAMPLE OCI
*CLEAR wa_zpokemon.
*wa_zpokemon-EMPLOYEE = '778'.
*wa_zpokemon-SURNAME = 'Tharo'.
*wa_zpokemon-FORENAME = 'Siv'.
*wa_zpokemon-TITLE = 'Ms'.
*wa_zpokemon-DOB = '20191023'.
*wa_zpokemon-INITIALS = 'SO'.
*wa_zpokemon-GENDER = 'F'.
*wa_zpokemon-SALARY = '23525'.
*wa_zpokemon-ECURRENCY = 'USD'.
*wa_zpokemon-ZZLOCATION = 'Warsaw'.
*wa_zpokemon-ZZDEPT = 'IT'.
*INSERT zpokemon FROM wa_zpokemon.
*
*WRITE: 'INSERT example Oci.'.
*IF sy-subrc = 0.
*  WRITE: 'Oci in place.'.
*ELSE.
*  WRITE: 'Lol, fail! You got ', sy-subrc, '!'.
*ENDIF.
*ULINE.
**END OF - Insert two exemplary records*********************************************
*
*DELETE FROM zpokemon WHERE forename = 'Siv'. "In the case of using WHERE, FROM too must be utilized.
*
*WRITE: 'DELETE TWO RECORDS.'.
*IF sy-subrc = 0.
*  WRITE: 'Two exemplary records deleted correctly.'.
*ELSE.
*  WRITE: 'The return code is: ', sy-subrc.
*ENDIF.
*ULINE.
*
**WARNING -> I need to be cautious with DELETE FROM table_name because such a statement without any WHERE will simply
**erase all records within the table.
*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> PROGRAM FLOW CONTROL AND LOGICAL EXPRESSIONS
*---------------------------------------------------------------------------------------------------------------------------------
**IF----------------------------------------
*DATA: item TYPE string.
*item = 'mug'.
*
*IF item = 'mug'.
*  WRITE: 'I can make if statements.'.
*ELSE.
*  WRITE: 'I cannot.'.
*ENDIF.
*ULINE.
*
*
*
**Linking logical expressions together----------------------------------------
**There is the old way of writing logical operators:
**EQ - equals,
**NE - not equals,
**LT - less than,
**GT - greater than,
**LE - less or equal,
**GE - greater or equal.
*
**I am doing OOP for fun <3
*CLASS dog DEFINITION.
*  PUBLIC SECTION.
*
*    CLASS-DATA: num_of_dogs TYPE i.
*    CLASS-METHODS class_constructor. "A static constructor.
*
*    METHODS constructor
*      IMPORTING
*         name            TYPE c
*         age             TYPE i
*         breed           TYPE c
*         happiness_level TYPE i.
*
*    METHODS: pet IMPORTING increment TYPE i EXPORTING result TYPE i,
*             view_dog,
*             show_the_dog_log,
*             get_happiness_level            EXPORTING result TYPE i,
*             get_name                       EXPORTING result TYPE c.
*
*  PRIVATE SECTION.
*    DATA: name(30)            TYPE c,
*          age                 TYPE i,
*          breed(30)           TYPE c,
*          happiness_level     TYPE i.
*
*    CLASS-DATA: dog_log TYPE i. "Used by my static constructor.
*ENDCLASS.                    "dog DEFINITION
**----------------------------------------------------------------------*
**       CLASS dog IMPLEMENTATION
**----------------------------------------------------------------------*
**
**----------------------------------------------------------------------*
*CLASS dog IMPLEMENTATION.
*  METHOD class_constructor. "The calculations do not really make sense, I think. I declared dog_log in a private section. I would need to prepare a method to reach for it.
*    IF dog_log NE 0.
*      dog_log = dog_log + 1.
*    ELSE.
*      dog_log = 1.
*    ENDIF.
*    WRITE: / 'Class dog (a classy dog!) has been used!'.
*    WRITE: / 'Current number of good bois is: ', dog_log.
*  ENDMETHOD.                    "class_constructor
*
*  METHOD constructor.
*    me->name = name.
*    me->age = age.
*    me->breed = breed.
*    me->happiness_level = happiness_level.
*    num_of_dogs = num_of_dogs + 1.
*  ENDMETHOD.                    "constructor
*
*  METHOD pet.
*    happiness_level = happiness_level + increment.
*  ENDMETHOD.                    "pet
*
*  METHOD view_dog.
*    WRITE: 'Name: ', name.
*    WRITE: 'Age: ', age.
*    WRITE: 'Breed: ', breed.
*    WRITE: 'Happiness level: ', happiness_level.
*  ENDMETHOD.                    "view_dog
*
*  METHOD show_the_dog_log.
*    WRITE: dog_log.
*  ENDMETHOD.                    "show_the_dog_log
*
*  METHOD get_happiness_level.
*    result = happiness_level.
*  ENDMETHOD.                    "get_happiness_level
*
*  METHOD get_name.
*    result = name.
*  ENDMETHOD.                    "get_name
*
*ENDCLASS.                    "dog IMPLEMENTATION
*
*
*START-OF-SELECTION. "Telling ABAP where I want to start the processing of my program.
*
*  DATA: dog_bravo TYPE REF TO dog,
*        dog_delta TYPE REF TO dog.
*
*  CREATE OBJECT: dog_bravo "The consturctor requires parameters so I need to pass them here. Shocking, innit?!
*    EXPORTING
*      name            = 'Attalos'
*      age             = 2
*      breed           = 'Huskylamute'
*      happiness_level = 10.
*  CREATE OBJECT: dog_delta
*    EXPORTING
*      name            = 'Kasztanek'
*      age             = 1
*      breed           = 'Huskylamute'
*      happiness_level = 10.
*
*  CALL METHOD: dog_bravo->view_dog.
*  ULINE.
*  CALL METHOD: dog_delta->view_dog.
*  ULINE.
*
*  DATA: the_result TYPE i.
*
**Below means - on dog_bravo call a method 'pet', put into the method 'increment' which has the value of 4, and take out
**the 'result' (both 'increment' and 'result' are the innards of the 'pet' method and upon the extraction of the result
**assign it to 'the_result'.)
*  CALL METHOD: dog_bravo->pet( EXPORTING increment = 4 IMPORTING result = the_result ).
*  CALL METHOD: dog_bravo->view_dog.
*  ULINE.
**Both good bois deserve petting.
*  CALL METHOD: dog_delta->pet( EXPORTING increment = 4 IMPORTING result = the_result ).
*  CALL METHOD: dog_delta->view_dog.
*  ULINE.
*
**CALL METHOD dog_bravo->show_the_dog_log. <---- technically, it works, but seems pointless. I basically require a method called on an object here
*  "because I declared 'dog_log' in private section. And it's always one anyway, I think, since it's
*  "used by the static constructor, it only can be called upon the creation of the first object
*  "and that value will just not increment... because the incrementation is defined within the class
*  "constructor.
*
**To call a static attribute of 'num_of_dogs'.
*  DATA: the_number_that_matters TYPE i.
*  the_number_that_matters = dog=>num_of_dogs.
*  WRITE: / 'There are currently ', the_number_that_matters, ' good bois around.'.
*
**And now about that linkage of logical expressions...
*  DATA: new_result1 TYPE i.
*  DATA: new_result2 TYPE i.
*  CALL METHOD: dog_bravo->get_happiness_level( IMPORTING result = new_result1 ).
*  CALL METHOD: dog_delta->get_happiness_level( IMPORTING result = new_result2 ).
*
*  IF new_result1 EQ 14 AND new_result2 EQ 14.
*    WRITE: / 'Both puppers are happy!'.
*  ELSE.
*    WRITE: / 'Fix that method, mate.'.
*  ENDIF.
*  ULINE.
*
*
*
**Nested IFs----------------------------------------
*  DATA: name_keeper(30) TYPE c,
*        name_holder(30) TYPE c.
*
*  CALL METHOD: dog_bravo->get_name( IMPORTING result = name_keeper ).
*  CALL METHOD: dog_delta->get_name( IMPORTING result = name_holder ).
*  IF name_keeper EQ 'Attalos'.
*    IF name_holder EQ 'Kasztanek'.
*      WRITE: 'Pupperino victoria.'.
*    ELSE.
*      WRITE: 'Second condition failed.'.
*    ENDIF.
*  ELSE.
*    WRITE: 'First condition failed.'.
*  ENDIF.
*  ULINE.
*
*
*
**Case statement----------------------------------------
**Kind of a Java's switch. They can be nested too.
*  CASE name_holder.
*    WHEN 'Attalos'.
*      WRITE: / 'A little pup!'.
*      CASE name_holder.               "A nested case.
*        WHEN 'Kasztanek'.             "A nested case.
*          WRITE: / 'A little pup 2!'. "A nested case.
*        WHEN OTHERS.                  "A nested case.
*          WRITE: 'Fix, lol!'.         "A nested case.
*      ENDCASE.                        "A nested case.
*    WHEN 'Kasztanek'.
*      WRITE: 'A little doggy!'.
*    WHEN OTHERS.
*      WRITE: 'Fix that method so that it shows DOGS.'.
*  ENDCASE.
*  ULINE.
*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> LOOPS
*---------------------------------------------------------------------------------------------------------------------------------
**SELECT----------------------------------------
*  TABLES: zpokemon.
*
**SELECT * FROM zpokemon.
**  WRITE: / zpokemon.                               "This will print out all the records within the table... Or it should, according to Pete. It doesn't work here.
**  ENDSELECT.
*
**  SELECT * FROM zpokemon WHERE surname = 'ANIKAR'.
**    WRITE: / zpokemon.                              "It doesn't want to print 'zpokemon' without me specifying the fields!
**  ENDSELECT.
*
*
*
**DO LOOP----------------------------------------
**sy-index keeps the index of the loop's iteration.
*DATA: a TYPE i.
*
*a = 0.
*
*DO 10 TIMES.
*  a = a + 1.
*  WRITE: / 'Dog.', a.
**  WRITE sy-index. "This will print out the same number set as 'a'. Outside of the loop, it's back to 0.
*ENDDO.
*ULINE.
*
*
**NESTED DO LOOP----------------------------------------
**Each DO LOOP has its own sy-index.
*DATA: b TYPE i,
*      c TYPE i,
*      d TYPE i.
*
*DO 3 TIMES.
*  b = b + 1.
*  WRITE: / 'Outer loop is at: ', b.
*  c = 0.
*  DO 3 TIMES.
*    c = c + 1.
*    WRITE: / 'Inner loop is at: ', c.
*  ENDDO.
*  d = d + c.
*ENDDO.
*  d = d + b.
*ULINE.
*WRITE: 'The total number of iterations is: ', d.
*ULINE.
*
*
*
**WHILE LOOP----------------------------------------
*DATA: u TYPE i,
*      y TYPE i.
*
*u = 0.
*y = 0.
*
*WHILE u <> 10.
*  WRITE: / 'Haha, lol!', u.
*    WHILE y <> 5.
*      WRITE: 'Nested rotfl!'.
*      y = y + 1.
*    ENDWHILE.
*  u = u + 1.
*ENDWHILE.
*ULINE.
*
*
*
**CONTINUE---------------------------------------- 03.11.2021
**Termination statements allow me to terminate a loop prematurely. There are two kinds of such statements:
**-those that apply to the loop,
**-those that apply to the processing block in which the loop occurs.
**CONTINUE is the doom of the processing of a loop. I can cut down the loop unconditionally using this statement.
*DATA: omg TYPE i VALUE 1.
*
*DO 15 TIMES.
*  omg = omg + 1.
*  IF sy-index = 2.          "When it's on the index 2...
*    CONTINUE.
*  ENDIF.
*  WRITE: / 'Omg is: ', omg. "... this will not be written down. Because CONTINUE aborts the processing of anything
*ENDDO.                      "left to process within the loop AND RETURNS TO THE BEGINNING OF THE LOOP.
*ULINE.
*
*
*
**CHECK----------------------------------------
**Allows for the termination of the loop passes, but also for the checking of the certain conditions first.
**It is kind of a combination of an IF statements and a CONTINUE statement.
*DATA: wtf TYPE i VALUE 0.
*
*DO 10 TIMES.
*  wtf = wtf + 1.
*  CHECK sy-index <> 2.      "Basically - 'If the system variable is at the second index, abandon the rest of the current
*  WRITE: / 'Wtf is: ', wtf. "loop and go back to the beginning of the loop.
*ENDDO.
*ULINE.
**CHECK can also be used outside of the loops, e.g. in subroutines (function modules?). It's essentially a very nice
**big red 'Do not press!' button.
*
*
*
**EXIT----------------------------------------
**Allows me to assasinate the loop without any conditions provided. The loop. It stops the entirety of the loop,
**unlike CONTINUE which terminates just the ongoing roll of the loop.
**If I use it in a subroutine then it will just abandon it and return to the main program.
*DATA: lmao TYPE i VALUE 0.
*
*DO 10 TIMES.
*  lmao = lmao + 1.
*  IF sy-index = 3.
*    EXIT.
*  ENDIF.
*  WRITE: / 'Lmao is: ', lmao. "Just two of those are written, because when it's index 3's time to shine
*ENDDO.                        "it just exits the loop altogether.
*WRITE: / 'Almost no lmaos written!'.
*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> SELECTION SCREENS
*---------------------------------------------------------------------------------------------------------------------------------
**Event (all these blocks) end only when another block starts.
*TABLES: zpokemon.
*
*DATA: wa_zpokemon LIKE zpokemon-employee.
*
**FORMATTING SELECTION SCREENS----------------------------------------
**Without this, system decided where it puts all of my selection screen objects. E.g. when I have a group of radiobuttons, I should organise them
**into their own group, visibly separate from other objects. The Selection-Screen statements requires Additions which specify the type of a layout option
**which I am defining.
*PARAMETERS: my_emp   LIKE zpokemon-employee DEFAULT 333 OBLIGATORY,
*            my_gend  LIKE zpokemon-gender VALUE CHECK, "Line 2679.
*            my_sur   LIKE zpokemon-surname DEFAULT 'Tatanka' LOWER CASE, "I can make sure the value will be in lower case. Otherwise, when I press enter on the parameter box - it defaults it to the upper case.
*            my_box   AS CHECKBOX. "I think I could use it just like radiobuttons were used in ZR07MLBE -> a condition for an IF statement.
*SELECTION-SCREEN SKIP 3. "ADDITION! Skips 3 lines here!
*SELECTION-SCREEN ULINE.  "ADDITION! Underlines.
*SELECTION-SCREEN ULINE /1(8). "ADDITION! SlASH means the new line, then comes the POSITION (how many characters to skip before printing the line) and in the brackets the LENGTH of the line.
*SELECTION-SCREEN ULINE /40(8). "Skip 40 characters and then print a line!
**ADDITION! COMMENT allows me to add text to the Selection Screen. The comment itself can either be a Text Element or a variable name.
**These variables are NOT declared within the DATA block, but when the program is started, so - in the INITIALIZATION block.
*SELECTION-SCREEN COMMENT /40(15) text-001.
*SELECTION-SCREEN COMMENT 60(15) comm1. "The lack of the slash means it will be in the same line as the comment above.
**I can format a single line by creating a block with BEGIN OF LINE and END OF LINE.
**I will get a syntax error if I try to use a SLASH in any of these two comments. That's a single line and no more allowed!
**Also, if I define a parameter field within BEGIN OF LINE-END OF LINE section, it does not display its technical name. A COMMENT is to be used.
**I can also use POSITION to decide where the element following that statement will be positioned.
**ELEMENT BLOCKS ---
**To group fields together. I can nest element blocks within element blocks.
**They are similar to BEGIN OF LINE.
*SELECTION-SCREEN BEGIN OF BLOCK my_block1 WITH FRAME TITLE text-001.
*SELECTION-SCREEN BEGIN OF LINE.
*SELECTION-SCREEN COMMENT 1(15) text-001.
*SELECTION-SCREEN COMMENT 20(20) comm2.
*SELECTION-SCREEN POSITION pos_high. "This can either be a number or I can use pos_low or pos_high to place stuff right where LOW and HIGH in usual SELECT-OPTIONS is placed!
*PARAMETER wtf(5).
*SELECTION-SCREEN END OF LINE.
*SELECTION-SCREEN END OF BLOCK my_block1.
*PARAMETERS: wa_green RADIOBUTTON GROUP grp1,
*            wa_blue  RADIOBUTTON GROUP grp1,
*            wa_yell  RADIOBUTTON GROUP grp1. "Only one of these radiobuttons can be selected! CTRL+F "radiobuttons"
*
*SELECT-OPTIONS: my_dob FOR zpokemon-dob NO-EXTENSION.
*
**INITIALIZATION----------------------------------------
*INITIALIZATION.                  "When the program is run -> it will be recognized I have this good boy over here so everything in this block will be executed first.
*  comm1 = 'Suuusuuumeeee!!!'.
*  comm2 = 'Deeediiicaaateee!'.
*  SELECT * FROM zpokemon.
*    wa_zpokemon = zpokemon-employee.
*  ENDSELECT.
*
**AT SELECTION SCREEN----------------------------------------
**Triggered when the user tries to execute the report. It's a good place to see what parameters have been provided.
**I can display a message for the user to tell them something isn't right if they provide incorrect parameters.
*AT SELECTION-SCREEN ON my_emp. "ON indicates to the system that the event (AT SELECTION-SCREEN) is specifically for this parameter.
*
**Checking if employee number is not greater than the last employee number within the table.
**wa_employee has the last employee because the SELECT kept overwriting the results until it went through the entire table.
**MESSAGE e000(ZBM_MES1) is a Text Message (explained below). It's different than Text Elements. e stands for Error (there are various
**ohter types), 000 is the number of the messgae that I created and ZBM_MES1 is the name of the Message Class which I also created.
**These are not integral parts of any program and can be reused.
**WITH is an addition that can be included. It allows me to add up to 4 different paramaters that can be passed into the message.
**In this case I can display the value entered into the error message that is going to be displayed.
**For the error message to be able to accept the addition, it needs to contain "&" within its text in a place where the additions is to be
**displayed.
**Message 000 does NOT contain an "&" and Message 001 does.
*  IF my_emp > wa_zpokemon.
*    MESSAGE e001(ZBM_MES1) WITH my_emp. "This is the error/warning message at the bottom of my program!
*  ENDIF.
*
*
*
**PARAMETERS----------------------------------------
**PARAMETERS: some_para TYPE i. <--- this will not work, because 'parameters cannot be defined locally (active FORM procedure or GET).
**                                   Basically, it will not allow me to declare any parameters after AT SELECTION-SCREEN has started.
**                                   Though, it's fine to declare it anywhere before or within INITIALIZATION.
*
*
*
**CHECKBOX----------------------------------------
**A checkbox always has to be of data type c. My data element 'my_box', if unchecked will hold a blank character. If ticked, it will hold an 'X'!
**Basically, a regular parameter allows me to enter any value. A checkbox allows either a blank or an 'X'.
*
**RADIOBUTTONS---
**The difference between them and checkboxes is that checkboxes are individual parameters in their own right and I can have many checkboxes and
**I can select many checkboxes on the screen.
**Radiobuttons have to belong to a group. Within those groups only a single radiobutton can be selected at any one time. Like checkboxes, they
**have to be of data type c and the length of one.
**So radiobuttons are to be used when I want to have a possibility of choosing between various options.
*
*
*
**SELECT-OPTIONS----------------------------------------
**Uses internal tables to store the provided values. These values need to be installed in a table in memory for our program to use.
**An internal table create thus has a similar restrction to parameters. They can only have a name that contains no more than eight characters.
**Select tables contain four separate fields which are defined when I create my SELECT-OPTIONS statement.
**These are:
** - sign <-- a data type c with one character's length. It determines for each record whether it should be included or excluded from the result set. The possible values that can be included here are 'I' and 'E'.
** - option <-- also type c, but the length of two. It holds the selection operator. Can contain EQ, NE, GT, LT, GE, LE, CP and NP. CP and NP.
** - low <-- the lower limit for a range of values that a user can enter.
** - high <-- the upper limit. Both low's and high's data types are determined by the database table to which my selection criteria is linked.
*
**When selection field is filled (whether a single value or multiple values), a record is generated and put into this internal table.
**There is no limit to how many records can be stored.
*
*
*
**VALUE CHECK----------------------------------------
**Allows me to include... value checking! :O Anything that is being entered is being checked against the valid value list that is
**defined in the ABAP dictionary (in the case of 'gender' up here, I created my own domain to which that data element belongs and
**that domain allows only three possible entries).
*
**To do some testing... <-- THIS DOESN'T WORK HERE! IT WORKS ONLY ABOVE INITIALIZATION! If I remove the Events, it works... but also works under START-OF-SELECTION!
**Which makes sense, given events are supposed to actually mark the blocks of code as doing specific tasks and they end only when the next one starts.
**START-OF-SELECTION.
**  SELECT * FROM zpokemon.
**    IF zpokemon-dob IN  my_dob.
**      WRITE: / zpokemon-dob.
**    ENDIF.
**  ENDSELECT.
*
*
*
**SELECT ADDITIONS----------------------------------------
**SELECT-OPTIONS can go with OBLIGATORY or LOWER CASE and so on.
**There is also a no extension addition. It allows me to prevent the use of multiple selections. Thus I can give a user the ability
**to make a value range selection, but stop them from entering multiple value ranges.
**It would look like:
**SELECT-OPTIONS: my_dob FOR zpokemon-dob NO-EXTENSION.
*
*
*
**TEXT ELEMENTS----------------------------------------
**Fields in the selection screen display their technical names unless I change that - 'Skok do' -> 'Elementy tekstowe' -> ...
**- The text elements responsible for the way fields' names are displayed are called Selection Texts.
**- If I try to copy a program copying of the Text Elements is obligatory, because when they are created they are an integral part of this program.
**- When Text Elements are created they belong to Text Pools - these pools hold all the text elements of my programs.
**- Every program I create is language independent which means Text Elements I create can be easily translated into other languages (??? Not sure how that works exactly ???).
**- There are three kinds of Text Elements that I can use: Selection Text, Text Symbols and List Headings.
**
**Text Symbols  -> give "flexibility" to a program allowing me to not have to code literals into the source code.
**List Headings -> when building reports, I also build report headers like the title, the fields' names the column headings etc. By using them instead of hardcoded headings,
**I can ensure they will be translated into any other required language. Also, if the headings need to change, I can just change the Text Elements instead of changing the source code.
*
**TEXT SYMBOLS ---
**E.g. when I want to WRITE: / "some message", I can use a Text Symbol instead and, by the grace of Lucifer - it will be automatically translated if need be.
**So in practice it could look like: WRTIE: / text-001. <- this is a pattern, it has too look like this, string 'text', a dash and a three digit number.
*
**WRITE: / text-001. " Susume?!
*
**MESSAGES----------------------------------------
**For providing feedback to the user in a way that is not a string literal. The concept of messages provides the facility to automatically translate such messages to other
**languages.
**First I need to store these messages in a message class which in turn is stored in database table t100. To create a message class -> se91.
**Messages are different from text elements in that they are NOT objects that are part of my program (unlike text elements). Messages are stored within t100. Due to that
**Text Messages can be resued in many programs.
*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------






*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> INTERNAL TABLES
*---------------------------------------------------------------------------------------------------------------------------------
**There are two methods of dealing with internal tables. The old way is HEADER LINE and the new way is WORK AREA.
**Internal tables can be defined using any number of other defined structures. This allows me to have many normal table structures
**grouped together and placed into a single internal table (something akin to a multidimensional array).
**The basic form of an internal table consists of a table body (all the records within the table) and a header record OR a table
**body and a separate work area.
**A header line or a work area is used when I want to read a single record from my internal table. When I read a record from the
**old style table, that record is placed into the header record and for the new style it is read into a work area (which is separate).
**Similarly, when creating a new record, it is first placed in the header/work area and then transferred into the body of the internal
**table.
**The introduction of work area allowed us to create multi-dimensional tables - tables within tables.
**The architecture of SAP limits the size of internal tables to around 2GB.
*
**There are different kinds of internal tables:
**1. Standard tables: give me an option to access the records via a table key or an index. When I access records using a key, the larger
**                    table is, the longer it will take to read the records. This is why I can use an index.
**                    Standard tables do not give me the option of defining a unique key, so I might have identical lines repeated. A
**                    standard internal table can thus hold many identical records.
**                    Accessing records using a table key may take a long time, but a standard table can also be filled with record very
**                    quickly because the system doesn't have to check the table for any duplicate records.
**2. Sorted tables:   a unique key can be defined and a duplication of records can be avoided. Records can be accessed using the table key
**                    or the table index. A table key can also be used to find records. Much like with the standard tables, it's not the
**                    fastest way possible, but a lot better for the sorted ones nonetheless.
**                    The usage of a sorted table over a standard table is preferred due to the increased speed of accessing records and
**                    because sorted tables sort my records into a specific sequence which gives me a performance increase when accessing
**                    the data.
**3. Hashed tables:   records are not accessed via an index. Only a unique key is to be used. Hashed tables are usually preferred when
**                    it comes to speed. When I know my internal table is going to be huge, a hashed table might be my best bet.
**                    Hash tables use a hash algorithm which makes them fast.
*
**OCCURS 0 tells SAP we are declaring an internal table with no records initially (even if I use OCCURS 5, I can easily add more than just
**5 records. OCCURS is basically obsolete). Using OCCURS automatically tells the system this is an internal table with a header record.
*DATA: BEGIN OF itab01 OCCURS 0,
*        surname LIKE zpokemon-surname,
*        dob     LIKE zpokemon-dob,
*      END OF itab01.
*
**Below internal table should be used because it complies with ABAP objects!
**I am just defining a LINE of an internal table here. No OCCURS also kind of means it's not yet a table. It's but a line of a table.
*TYPES: BEGIN OF line01_typ,
*        surname LIKE zpokemon-surname,
*        dob     LIKE zpokemon-dob,
*  END OF line01_typ.
*
**Below I am defining the table type. This is going to be a standard table. So it can have multiple identical records so no unique key
**needs to be included in the table type definition. There's no OCCURS here, but I can use INITIAL SIZE if I chose to, but it's optional.
*TYPES itab02_typ TYPE STANDARD TABLE OF line01_typ.
**Below table is sorted and so it requires the information of what it's going to be sorted by. In this case - a surname.
*TYPES itab03_typ TYPE SORTED TABLE OF line01_typ WITH UNIQUE KEY surname.
*
**The above are just blueprints. Now I declare an actual table based on the table type. Technically, I could add WITH HEADER LINE at the
**end, but I should not as this would make the table unusable with ABAP objects.
*DATA itab02 TYPE itab02_typ.
**And I need a WORK AREA! It will be used in conjunction with the table I just defined. WA is not part of the internal table. I move
**data to my WA, I work with it and then I update my table from the WA. WA is a completely separate entity - if I have multiple
**tables of the same structure, I can use a single work area to read and write data to and from them.
*DATA wa_itab02 TYPE line01_typ.
*
**POPULATING AN INTERNAL TABLE WITH A HEADER LINE----------------------------------------
**When I read or write data to or from an internal table that has a header line, said data is always moved through the header line itself.
**When I read a record from the internal table, that record is moved to the header line and I access it there. When I want to add a record
**to the internal table, I move it to the header line which then gets appended to the internal table.
*TABLES: zpokemon.
**
*DATA: BEGIN OF very_tab OCCURS 0,
*  employee LIKE zpokemon-employee,
*  surname  LIKE zpokemon-surname,
*  forename LIKE zpokemon-forename,
*  title    LIKE zpokemon-title,
*  dob      LIKE zpokemon-dob,
*  los      TYPE i VALUE 3, "Length of service.
*END OF very_tab.
*
**FIRST METHOD ---> ARRAY FETCH----------------------------------------
*
**Below means the records from zpokemon will be moved to very_tab by matching them by their names.
**It is called an 'array fetch' -> it picks up records and puts them in my table all at once. It is different than performing a SELECT
**within a loop, because then it grabs every record one at a time. An 'array fetch' goes big and grabs them all at once. An 'array fetch'
**does not have an ENDSELECT statement.
**The extra field, 'los', will be added to every record and assigned the value of 3.
**Using an array fetch I am not populating my table line by line and I am taking away the loop generated by the SELECT and ENDSELECT
**statements. Only fields that correspond to those within the strucutre they are to move to are moved. This type of a SELECT statement is
**much faster than using a loop.
**Also no header record is being used here - I am using a block by block array fetch method to fill my table.
*SELECT * FROM zpokemon
*  INTO CORRESPONDING FIELDS OF TABLE very_tab.
*
**In the debugger -  a hat symbol represents the header line. When I F5 this good boy, all records will be placed inside in one fell swoop,
**because it's an array fetch!
*WRITE very_tab-surname.
*
**SECOND METHOD ---> APPEND----------------------------------------
*
**Append is another way of filling an internal table. Instead of doing an array fetch, this is a loop and I am grabbing every record one
**at a time. Essentially, the first record will be selected and then I am performing individual MOVE statements to move the data, field by
**field to the corresponding fields of very_tab. APPEND tells the system to take the values from the header record and add them to the body
**of the internal table.
**It is a good practice to clear the header record as soon as the data held within is appended to the body of the internal table. Otherwise
**SAP will have to keep overwriting the data previously held within every field of the header record.
**Every record, upon being appended to the table, will also be given a default value of 3 to 'los' field as per the definition of the table.
**WITHOUT THE APPEND IT WILL JUST KEEP OVERWRITING THE CONTENT OF THE HEADER LINE BECAUSE THE DATA IS NOT BEING PASSED FURTHER ON TO
**THE ACTUAL TABLE. In the debugger, if I F5 it, at the end of the loop (when all the fields are filled with MOVE statement), SAP will just
**start overwriting the data already present within the header record.
*SELECT * FROM zpokemon.
*  MOVE zpokemon-employee TO very_tab-employee.
*  MOVE zpokemon-surname  TO very_tab-surname.
*  MOVE zpokemon-forename TO very_tab-forename.
*  MOVE zpokemon-title    TO very_tab-title.
*  MOVE zpokemon-dob      TO very_tab-dob.
*  APPEND very_tab.
*ENDSELECT.
*
*WRITE very_tab-surname.
*
**THIRD METHOD ---> MOVE-CORRESPONDING----------------------------------------
*
**Similar to the above, but way shorter. I also need to specify the name of the table again within the operation itself. This method matches up the
**technical name of each field from the zpokemon with a matching field in very_tab - when such a match is found, contents are moved. With
**this method I need to make sure the fields are named alike in both tables. Fields moved to and from also need to be of the same data type
**and length.
**Just for the record - this is NOT an array fetch. It grabs record by record, not all at once.
*SELECT * FROM zpokemon.
*  MOVE-CORRESPONDING zpokemon TO very_tab.
*  APPEND very_tab.
*ENDSELECT.
*
*WRITE very_tab-surname.
*
**ANOTHER WAY OF CREATING AN INTERNAL TABLE ---> INCLUDE STRUCTURE.
**A statement that I can use to add various structures that I've already defined or have already been defined to build up my own internal table.
**Other data elements can also be added (e.g. count).
*DATA: BEGIN OF very_tab2 OCCURS 0.
*        INCLUDE STRUCTURE very_tab.
**       INCLUDE STRUCTURE zpokemon. "Field would be repeated because very_tab and zpokemon have similar ones, but that's just an example. It throws an error due to that repeat!
*        DATA count TYPE i.
*DATA END OF very_tab2.
*
*
*
*
***FILLING AN INTERNAL TABLE WITH A WORK AREA----------------------------------------
**The fundamental difference is that when selecting records from the table I am using a SEPARATE work area instead of the internal table's
**OWN header line.
*
**Declaring a line type... I think this is basically the equivalent of a database table. Like having tables TYPE STANDARD TABLE OF mara.
*TYPES: BEGIN OF line03_typ,
*  surname LIKE zpokemon-surname,
*  dob     LIKE zpokemon-dob,
*END OF line03_typ.
*
**Declaring a 'table type' based on the 'line type'. (I think that this could be omitted and I could go straight to declaring the table itself.)
*TYPES itab03_typ TYPE STANDARD TABLE OF line03_typ.
*
**Declaring the table itself based on the 'table type'. (I think I could just do a DATA itab03 TYPE STANDARD TABLE OF line03_typ. here.)
*DATA itab03    TYPE itab03_typ.
*DATA itab04    TYPE STANDARD TABLE OF line03_typ. "I think that's literally the same as above, but with fewer steps.
*DATA wa_itab03 TYPE line03_typ.
*
**I CAN EITHER FILL MY INTERNAL TABLE VIA MY WORK AREA...
**Works the same with both itab03 and itab04.
*SELECT surname dob FROM zpokemon
*  INTO wa_itab03.
*  APPEND wa_itab03 TO itab03.
*ENDSELECT.
*
**OR BY AN ARRAY FETCH...
***An array fetch is possible with Work Areas too!... And it skips the Work Area just like before, with Header Lines, it skipped the Header Line.
**SELECT * FROM zpokemon
**  INTO CORRESPONDING FIELDS OF TABLE itab03.
**
**Confirming if records are indeed inserted into the table. It was declared with the Work Area, so I am moving records from itab to wa.
*LOOP AT itab03 INTO wa_itab03.
*  WRITE wa_itab03-surname.
*ENDLOOP.
*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------







*---------------------------------------------------------------------------------------------------------------------------------
*UDEMY'S PROGRAM -> LOOPING THROUGH INTERNAL TABLES
*---------------------------------------------------------------------------------------------------------------------------------
*Reading through the records of an internal table line by line using a loop. Standard ABAP Dictionary Table's records are accessed
*via SELECT and ENDLSELECT statements (unless it's an array fetch!) while internal table's records are accessed via LOOP and ENDLOOP
*statements.

*STEPS FOR THE TABLE WITH THE HEADER LINE:
*Without declaring the Standard ABAP Dictionary Table here, it throws an error in the SELECT statement claiming that
*the 'destination area' needs to be inserted directly by INTO clause or indirectly by TABLES instruction.
*Which means that the Standard ABAP Dictionary Table from which I am extracting data is considered 'destination' here.
TABLES: zpokemon.

*1) This is my internal table.
DATA: BEGIN OF very_tab OCCURS 0,
  employee LIKE zpokemon-employee,
  surname  LIKE zpokemon-surname,
  forename LIKE zpokemon-forename,
  title    LIKE zpokemon-title,
  dob      LIKE zpokemon-dob,
  los      TYPE i VALUE 3, "Length of service.
END OF very_tab.

*2) This is how I access Standard ABAP Dictionary Table's records and put them within my internal table.
SELECT * FROM zpokemon.
  MOVE zpokemon-employee TO very_tab-employee.
  MOVE zpokemon-surname  TO very_tab-surname.
  MOVE zpokemon-forename TO very_tab-forename.
  MOVE zpokemon-title    TO very_tab-title.
  MOVE zpokemon-dob      TO very_tab-dob.
  APPEND very_tab.
ENDSELECT.

*3) Perform whatever I want to do with internal table's records within my loop. When I access records of an internal
*table with a header line, each record gets transferred one record at a time from the body of the internal table to the
*header line.
LOOP AT very_tab.
  WRITE: / very_tab-surname, very_tab-forename. "Underneath, the WRITE accessed the header line here.
ENDLOOP.

*MODIFY----------------------------------------
*If the IF statement is true, then MODIFY will take the content of the header line that has just been updated and update
*the record in the internal table that was originally read into the header record.
*Without the MODIFY, it will still WRITE the updated value, but, I believe, only the content of the header line is updated
*this way and the internal table itself still holds the original value.
*MODIFY, when used inside a loop of an internal table, has some specific features. It changes only the content of the existing
*line in the internal table that I've read and does not create a new record. It is always the current line that is changed when
*MODIFY is within a loop. It should not be used to modify the key fields that use a unique key.
*If MODIFY is used outside of a loop - I must specify a record's index number that I want to modify. It's not required within
*loops, because, while in a loop, the system monitors the index number automatically.
*MODIFY can be used like that only with index tables and tables with header lines.
LOOP AT very_tab.
  IF very_tab-surname = 'TOHANA'.
    very_tab-surname = 'Taehana'.
*    MODIFY very_tab.
  ENDIF.
  WRITE very_tab-surname.
ENDLOOP.
*---------------------------------------------------------------------------------------------------------------------------------
*END OF PROGRAM.
*---------------------------------------------------------------------------------------------------------------------------------






**************************************
*BACK-UP ZWIEK, GDY� PR�BUJ� KOPIUJ-WKLEJ �EBY "OBEJ��" T� POGMATWAN� LOGIK�

*"Muh example: 0E0130
*
*INCLUDE ZWM_WIEKOWANIE_PARTIA_TOP.
*INCLUDE ZWM_WIEKOWANIE_PARTIA_SEL.
*
**Si�gni�cie po numery partii materia��w. Dane s� w �rodku. Numer materia�u i numer partii.
*SELECT matnr charg FROM mcha INTO TABLE bt_holder
*      WHERE matnr = so_matnr-low.
*
**To dzia�a je�eli so_matnr-low. Dla SELECTION-OPTIONS nawet nie rusza.
**LOOP AT bt_holder ASSIGNING <fs_hol>.
**  IF <fs_hol> IS ASSIGNED.
**    WRITE: / <fs_hol>-matnr,
**           <fs_hol>-charg_d.
**  ELSE.
**    WRITE: 'Omfg'.
**  ENDIF.
**ENDLOOP.
*
*
*ULINE.
*
*
*t_main-matnr = '0E0130'.
*t_main-ran1 = 10.
*t_main-ran2 = 20.
*t_main-ran3 = 30.
**Warto�ci udaje si� przypisa�, to dzia�a.
*APPEND t_main.
**t_main tu wy�ej to de facto obszar roboczy i musz� doda� APPENDa, �eby doda� to do tabeli.
*WRITE: / t_main-matnr, t_main-ran1, t_main-ran2, t_main-ran3.
*ULINE.
*WRITE: 'Below should be the logic!'.
*ULINE.
****************************************************************************************************************************************************
**TO JEST DZIA�AJ�CA LOGIKA ZAPISU I WY�WIETLANIA
****************************************************************************************************************************************************
**Testowanie idei na wy�wietlanie tego samego rekordu z tabeli tyle razy ile jest numer�w partii z innym tym�e numerem za ka�dym razem.
*LOOP AT t_main INTO s_main.
*  CLEAR s_display.
*  s_display-matnr = s_main-matnr.
*  s_display-ran1 = s_main-ran1.
*  s_display-ran2 = s_main-ran2.
*  s_display-ran3 = s_main-ran3.
*    LOOP AT bt_holder INTO s_bholder WHERE matnr = s_main-matnr.
*      s_display-charg_d = s_bholder-charg_d.
*      APPEND s_display TO t_display.
*    ENDLOOP.
*    WRITE: / t_display-matnr,
*             t_display-ran1,
*             t_display-ran2,
*             t_display-ran3,
*             t_display-charg_d.
*ENDLOOP.
**
**WRITE: / 'This should work!'.
*ULINE.
*
**G�wno nie dzia�a!!!!!!!!!!!!!! ... W sumie ju� dzia�a, chyba dzi�ki APPEND przy t_main.
*LOOP AT t_display ASSIGNING <fs_dis>.
*  IF <fs_dis> IS ASSIGNED.
*    WRITE: / <fs_dis>-matnr,
*             <fs_dis>-ran1,
*             <fs_dis>-ran2,
*             <fs_dis>-ran3,
*             <fs_dis>-charg_d.
*  ELSE.
*    WRITE: 'Pierdololo'.
*  ENDIF.
*ENDLOOP.
****************************************************************************************************************************************************
**OOOooooOOOOooooOOOOO I AM UNBEATABLE!!!
****************************************************************************************************************************************************
*
*
*
*
*
*
**SELECT matnr FROM mara
**
**TYPES: BEGIN OF gtyp_outtab,
** matnr        LIKE mara-matnr,
** invent       LIKE mard-labst,
** vstprs       TYPE salk3,
** vstpre       TYPE salk3,
** vstprb       TYPE salk3,
** maktx        LIKE makt-maktx,
** matkl        LIKE mara-matkl,
** volum        LIKE mara-volum,
** alkoh        TYPE p DECIMALS 4,
** mtstb        LIKE t141t-mtstb,
** mtart        LIKE mara-mtart,
** meins        LIKE mseg-meins,
** labst        LIKE mard-labst,
** over         TYPE p DECIMALS 2,
** erfme        LIKE mseg-erfme,
** charg_d      TYPE mcha-charg,
** END OF gtyp_outtab.
*
*
*
*
*
*
*
*
*
*
**PERFORM build_fieldcatalog.
*
**FORM build_fieldcatalog .
**
**  gt_fieldcatalog-fieldname   = 'MATNR'.
**  gt_fieldcatalog-seltext_m   = 'Material'.
**  gt_fieldcatalog-outputlen   = 20.
**  APPEND gt_fieldcatalog TO gt_fieldcatalog.
**  CLEAR  gt_fieldcatalog.
**
**  gt_fieldcatalog-fieldname   = 'MAKTX'.
**  gt_fieldcatalog-seltext_m   = 'Description'.
**  gt_fieldcatalog-outputlen   = 30.
**  APPEND gt_fieldcatalog TO gt_fieldcatalog.
**  CLEAR  gt_fieldcatalog.
**
**  gt_fieldcatalog-fieldname   = 'MATKL'.
**  gt_fieldcatalog-seltext_m   = 'Group'.
**  gt_fieldcatalog-outputlen   = 10.
**  APPEND gt_fieldcatalog TO gt_fieldcatalog.
**  CLEAR  gt_fieldcatalog.
*
**  gt_fieldcatalog-fieldname   = 'MTSTB'.
**  gt_fieldcatalog-seltext_m   = 'Status desc.'.
**  gt_fieldcatalog-outputlen   = 17.
**  APPEND gt_fieldcatalog TO gt_fieldcatalog.
**  CLEAR  gt_fieldcatalog.
**
**  gt_fieldcatalog-fieldname   = 'MTART'.
**  gt_fieldcatalog-seltext_m   = 'Group 2'.
**  gt_fieldcatalog-outputlen   = 10.
**  APPEND gt_fieldcatalog TO gt_fieldcatalog.
**  CLEAR  gt_fieldcatalog.
**
**  gt_fieldcatalog-fieldname   = 'VOLUM'.
**  gt_fieldcatalog-seltext_m   = 'Volume'.
**  gt_fieldcatalog-outputlen   = 8.
**  APPEND gt_fieldcatalog TO gt_fieldcatalog.
**  CLEAR  gt_fieldcatalog.
**
**  gt_fieldcatalog-fieldname   = 'ALKOH'.
**  gt_fieldcatalog-seltext_m   = 'Alkohol'.
**  gt_fieldcatalog-outputlen   = 8.
**  APPEND gt_fieldcatalog TO gt_fieldcatalog.
**  CLEAR  gt_fieldcatalog.
**
**  gt_fieldcatalog-fieldname   = 'INVENT'.
**  gt_fieldcatalog-seltext_m   = 'INVENTORY (UM)'.
**  gt_fieldcatalog-outputlen   = 13.
**  APPEND gt_fieldcatalog TO gt_fieldcatalog.
**  CLEAR  gt_fieldcatalog.
**
**  gt_fieldcatalog-fieldname   = 'MEINS'.
**  gt_fieldcatalog-seltext_m   = 'UNIT'.
**  gt_fieldcatalog-outputlen   = 13.
**  APPEND gt_fieldcatalog TO gt_fieldcatalog.
**  CLEAR  gt_fieldcatalog.
**
**  gt_fieldcatalog-fieldname   = 'VSTPRB'.
**  gt_fieldcatalog-seltext_m   = 'INVENTORY (PLN)'.
**  gt_fieldcatalog-outputlen   = 13.
**  APPEND gt_fieldcatalog TO gt_fieldcatalog.
**  CLEAR  gt_fieldcatalog.
**
**  gt_fieldcatalog-fieldname   = 'VSTPRE'.
**  gt_fieldcatalog-seltext_m   = 'EXCISE (PLN)'.
**  gt_fieldcatalog-outputlen   = 13.
**  APPEND gt_fieldcatalog TO gt_fieldcatalog.
**  CLEAR  gt_fieldcatalog.
**
**  gt_fieldcatalog-fieldname   = 'VSTPRS'.
**  gt_fieldcatalog-seltext_m   = 'INVENTORY (PLN)'.
**  gt_fieldcatalog-outputlen   = 13.
**  APPEND gt_fieldcatalog TO gt_fieldcatalog.
**  CLEAR  gt_fieldcatalog.
**
**  gt_fieldcatalog-fieldname   = 'OVER'.
**  gt_fieldcatalog-seltext_m   = 'Overstock Value  (PLN)'.
**  gt_fieldcatalog-outputlen   = 13.
**  APPEND gt_fieldcatalog TO gt_fieldcatalog.
**  CLEAR  gt_fieldcatalog.
**
**  gt_fieldcatalog-fieldname  = 'CHARG_D'.
**  gt_fieldcatalog-seltext_m  = 'nr partii materia��w'.
**  gt_fieldcatalog-outputlen  = 10.
**  APPEND gt_fieldcatalog TO gt_fieldcatalog.
**  CLEAR  gt_fieldcatalog.
**
**
**ENDFORM.




*"c1 nr_fak dataop1 dataop kwota kwota1 kwota2 kwota3 c3 kwota4 kwota5 kwota6 kwota7 c29. "bmierzwi 13.10.2021 -> changed variables (previously 'c1 nr_fak c2 dataop c3 c4 c5
"kwota c6').
*TABLES: mseg.
*SELECT * UP TO 10 ROWS FROM mseg WHERE insmk = ''.
*  WRITE: / mseg-matnr.
*ENDSELECT.






**********************************************************************************************************************
*TESTING FOR ZR07MLBE
**********************************************************************************************************************
*TYPES : BEGIN OF stype_mbew,                                "n450764
*          matnr              LIKE      mbew-matnr,          "n450764
*          bwkey              LIKE      mbew-bwkey,          "n450764
*          bwtar              LIKE      mbew-bwtar,          "n450764
*          lbkum(09)          TYPE p    DECIMALS 3,          "n450764
*          salk3(09)          TYPE p    DECIMALS 2,
*          bwtty              LIKE      mbew-bwtty,          "n1227439
*        END OF stype_mbew,                                  "n450764
*                                                            "n450764
*        stab_mbew            TYPE STANDARD TABLE OF stype_mbew.
*                                                            "n450764
*DATA: g_s_mbew               TYPE  stype_mbew,              "n450764
*      g_t_mbew               TYPE  stab_mbew.
*DATA: l_t_mbew              TYPE  stab_mbew.
*
*SELECT matnr bwkey bwtar lbkum salk3 bwtty UP TO 10 ROWS
*    FROM mbew
*    INTO CORRESPONDING FIELDS OF TABLE l_t_mbew
*    "WHERE  matnr = '4900123495'. "IN  MATNR
*    WHERE matnr IN ( SELECT matnr FROM mseg WHERE insmk = 3 ). "DODAJ JAKIE� MATNR'y
*
*IF l_t_mbew[] IS INITIAL.
*  WRITE: 'LOL!'.
*ELSE.
*  WRITE: 'ES NUMERO UNO'.
*ENDIF.

*THESE WERE MY INITIAL ATTEMPTS TO FIRST EXTRACT INSMKS FOR ALL MATNRS**********************************************

*Select INSMK for every MATNR provided.
*TYPES: BEGIN OF insmk_holder,
*  hol_matnr LIKE mseg-matnr,
*  hol_insmk LIKE mseg-insmk,
*  END OF insmk_holder.
*
*DATA: itab_insmk_holder TYPE STANDARD TABLE OF insmk_holder,
*      wa_insmk_holder TYPE insmk_holder.
*
*SELECT     matnr insmk
*FROM       mseg
*INTO TABLE itab_insmk_holder
*WHERE matnr IN MATNR.

*OUT HERE TO GET SOME MATNRS FROM MSEG THAT HAVE TWO KINDS OF INSMKS************************************************
*TABLES: mseg.
*
*TYPES: BEGIN OF matnr_itab,
*       matnr LIKE mseg-matnr,
*       insmk LIKE mseg-insmk,
*  END OF matnr_itab.
*
*DATA: imp_matnr_itab TYPE STANDARD TABLE OF matnr_itab,
*      wa_matnr_itab TYPE matnr_itab.
*
*SELECT matnr insmk UP TO 100 ROWS
*FROM mseg
*INTO TABLE imp_matnr_itab
*WHERE insmk = 'S' AND insmk = ''.
*
*LOOP AT imp_matnr_itab INTO wa_matnr_itab.
*  WRITE: / wa_matnr_itab-matnr, wa_matnr_itab-insmk.
*ENDLOOP.
*
**No dzia�a, ale w sumie nie wiem co mi to daje. :< Musz� znale�� jaki� MATNR maj�cy r�ne INSMKi.




*DLA ZBM07MLBE
*IF storage = 'XLABST'.
*  BREAK-POINT                ID mmim_rep_mb5b.
*
* IF g_f_msegex_act is initial.
*
*  IF      pa_dbstd = 'X'.
*    PERFORM hdb_check_table USING 'MKPF' 'MSEG'.
*    SELECT (g_t_mseg_fields)
*         INTO CORRESPONDING FIELDS OF TABLE g_t_mseg_lean
*         FROM mkpf AS mkpf  JOIN mseg AS mseg
*                  ON mkpf~mandt  =  mseg~mandt  AND
*                     mkpf~mblnr  =  mseg~mblnr  AND
*                     mkpf~mjahr  =  mseg~mjahr
*         CONNECTION (dbcon)
*         WHERE mseg~matnr  IN  matnr
*           AND mseg~werks  IN  g_ra_werks
*           AND mseg~lgort  IN  g_ra_lgort
*           AND mseg~charg  IN  charg
*           AND mseg~bwtar  IN  bwtar
*           AND mseg~bwart  IN  bwart
*           AND mkpf~budat  GE  datum-low
*           AND mseg~sobkz  IN  g_ra_sobkz
*           AND matnr IN ( SELECT matnr FROM mseg WHERE insmk = 'F' OR insmk = '' ) "bmierzwi 26.10.2021 -> the reason for the enhancement.
*    %_HINTS
*    DB2    '&SUBSTITUTE VALUES&'
*    ORACLE '&SUBSTITUTE VALUES&'.
*
*  ELSEIF  pa_dbmat = 'X'.
*    PERFORM hdb_check_table USING 'MKPF' 'MSEG'.
*    SELECT (g_t_mseg_fields)
*         INTO CORRESPONDING FIELDS OF TABLE g_t_mseg_lean
*         FROM mseg AS mseg  JOIN mkpf AS mkpf
*                  ON mkpf~mandt  =  mseg~mandt  AND
*                     mkpf~mblnr  =  mseg~mblnr  AND
*                     mkpf~mjahr  =  mseg~mjahr
*         CONNECTION (dbcon)
*         WHERE mseg~matnr  IN  matnr
*           AND mseg~werks  IN  g_ra_werks
*           AND mseg~lgort  IN  g_ra_lgort
*           AND mseg~charg  IN  charg
*           AND mseg~bwtar  IN  bwtar
*           AND mseg~bwart  IN  bwart
*           AND mkpf~budat  GE  datum-low
*           AND mseg~sobkz  IN  g_ra_sobkz
*           AND matnr IN ( SELECT matnr FROM mseg WHERE insmk = 'F' OR insmk = '' ) "bmierzwi 26.10.2021 -> the reason for the enhancement.
*    %_HINTS
*    ADABAS   'ORDERED'
*    INFORMIX 'ORDERED'
*    MSSQLNT  'OPTION FORCE ORDER'
*    DB6 '<NLJOIN><IXSCAN TABLE=''MSEG'' SAP_INDEX=''M''/>'
*    DB6 '<IXSCAN TABLE=''MKPF'' SAP_INDEX=''0''/></NLJOIN>'.
*
*  ELSEIF  pa_dbdat = 'X'.
*    PERFORM hdb_check_table USING 'MKPF' 'MSEG'.
*    SELECT (g_t_mseg_fields)
*         INTO CORRESPONDING FIELDS OF TABLE g_t_mseg_lean
*         FROM mkpf AS mkpf  JOIN mseg AS mseg
*                  ON mkpf~mandt  =  mseg~mandt  AND
*                     mkpf~mblnr  =  mseg~mblnr  AND
*                     mkpf~mjahr  =  mseg~mjahr
*         CONNECTION (dbcon)
*         WHERE mseg~matnr  IN  matnr
*           AND mseg~werks  IN  g_ra_werks
*           AND mseg~lgort  IN  g_ra_lgort
*           AND mseg~charg  IN  charg
*           AND mseg~bwtar  IN  bwtar
*           AND mseg~bwart  IN  bwart
*           AND mkpf~budat  GE  datum-low
*           AND mseg~sobkz  IN  g_ra_sobkz
*           AND matnr IN ( SELECT matnr FROM mseg WHERE insmk = 'F' OR insmk = '' ) "bmierzwi 26.10.2021 -> the reason for the enhancement.
*    %_HINTS
*    INFORMIX 'ORDERED'
*    ADABAS 'ORDERED'
*    MSSQLNT  'OPTION FORCE ORDER'
*    DB6 '<NLJOIN><IXSCAN TABLE=''MKPF'' SAP_INDEX=''BUD''/>'
*    DB6 '<IXSCAN TABLE=''MSEG'' SAP_INDEX=''0''/></NLJOIN>'.
*  ELSE.
*
*    MOVE  1                  TO  sy-subrc.
*  ENDIF.
*
* ELSE.
*
*  IF g_f_msegex_act = 'H'.
*
*    PERFORM hdb_check_table USING 'MKPF' 'MSEG'.
*    SELECT (G_T_MSEG_FIELDS)
*         INTO CORRESPONDING FIELDS OF TABLE G_T_MSEG_LEAN
*         FROM MKPF AS MKPF  JOIN MSEG AS MSEG
*                  ON MKPF~MANDT  =  MSEG~MANDT  AND
*                     MKPF~MBLNR  =  MSEG~MBLNR  AND
*                     MKPF~MJAHR  =  MSEG~MJAHR
*         CONNECTION (dbcon)
*         WHERE MSEG~MATNR       IN  MATNR
*           AND MSEG~WERKS       IN  G_RA_WERKS
*           AND MSEG~LGORT       IN  G_RA_LGORT
*           AND MSEG~CHARG       IN  CHARG
*           AND MSEG~BWTAR       IN  BWTAR
*           AND MSEG~BWART       IN  BWART
*           AND MSEG~BUDAT_MKPF  GE  DATUM-LOW
*           AND MSEG~SOBKZ       IN  G_RA_SOBKZ
*           AND matnr IN ( SELECT matnr FROM mseg WHERE insmk = 'F' OR insmk = '' ) "bmierzwi 26.10.2021 -> the reason for the enhancement.
*    %_HINTS
*    DB2    '&SUBSTITUTE VALUES&'
*    ORACLE '&SUBSTITUTE VALUES&'.
*  ELSE.
*        PERFORM hdb_check_table USING 'MKPF' 'MSEG'.
*        SELECT (G_T_MSEG_FIELDS)
*         INTO CORRESPONDING FIELDS OF TABLE G_T_MSEG_LEAN
*         FROM MKPF AS MKPF  JOIN MSEG AS MSEG
*                  ON MKPF~MANDT  =  MSEG~MANDT  AND
*                     MKPF~MBLNR  =  MSEG~MBLNR  AND
*                     MKPF~MJAHR  =  MSEG~MJAHR
*         CONNECTION (dbcon)
*         WHERE MSEG~MATNR       IN  MATNR
*           AND MSEG~WERKS       IN  G_RA_WERKS
*           AND MSEG~LGORT       IN  G_RA_LGORT
*           AND MSEG~CHARG       IN  CHARG
*           AND MSEG~BWTAR       IN  BWTAR
*           AND MSEG~BWART       IN  BWART
*           AND MSEG~BUDAT_MKPF  GE  DATUM-LOW
*           AND MSEG~SOBKZ       IN  G_RA_SOBKZ
*           AND matnr IN ( SELECT matnr FROM mseg WHERE insmk = 'F' OR insmk = '' ). "bmierzwi 26.10.2021 -> the reason for the enhancement.
*  ENDIF.
* ENDIF.
*
*ELSEIF storage = 'XINSME'.
*    BREAK-POINT                ID mmim_rep_mb5b.
*
* IF g_f_msegex_act is initial.
*
*  IF      pa_dbstd = 'X'.
*    PERFORM hdb_check_table USING 'MKPF' 'MSEG'.
*    SELECT (g_t_mseg_fields)
*         INTO CORRESPONDING FIELDS OF TABLE g_t_mseg_lean
*         FROM mkpf AS mkpf  JOIN mseg AS mseg
*                  ON mkpf~mandt  =  mseg~mandt  AND
*                     mkpf~mblnr  =  mseg~mblnr  AND
*                     mkpf~mjahr  =  mseg~mjahr
*         CONNECTION (dbcon)
*         WHERE mseg~matnr  IN  matnr
*           AND mseg~werks  IN  g_ra_werks
*           AND mseg~lgort  IN  g_ra_lgort
*           AND mseg~charg  IN  charg
*           AND mseg~bwtar  IN  bwtar
*           AND mseg~bwart  IN  bwart
*           AND mkpf~budat  GE  datum-low
*           AND mseg~sobkz  IN  g_ra_sobkz
*           AND matnr IN ( SELECT matnr FROM mseg WHERE insmk = 'X' OR insmk = 2 ) "bmierzwi 26.10.2021 -> the reason for the enhancement.
*    %_HINTS
*    DB2    '&SUBSTITUTE VALUES&'
*    ORACLE '&SUBSTITUTE VALUES&'.
*
*  ELSEIF  pa_dbmat = 'X'.
*    PERFORM hdb_check_table USING 'MKPF' 'MSEG'.
*    SELECT (g_t_mseg_fields)
*         INTO CORRESPONDING FIELDS OF TABLE g_t_mseg_lean
*         FROM mseg AS mseg  JOIN mkpf AS mkpf
*                  ON mkpf~mandt  =  mseg~mandt  AND
*                     mkpf~mblnr  =  mseg~mblnr  AND
*                     mkpf~mjahr  =  mseg~mjahr
*         CONNECTION (dbcon)
*         WHERE mseg~matnr  IN  matnr
*           AND mseg~werks  IN  g_ra_werks
*           AND mseg~lgort  IN  g_ra_lgort
*           AND mseg~charg  IN  charg
*           AND mseg~bwtar  IN  bwtar
*           AND mseg~bwart  IN  bwart
*           AND mkpf~budat  GE  datum-low
*           AND mseg~sobkz  IN  g_ra_sobkz
*           AND matnr IN ( SELECT matnr FROM mseg WHERE insmk = 'X' OR insmk = 2 ) "bmierzwi 26.10.2021 -> the reason for the enhancement.
*    %_HINTS
*    ADABAS   'ORDERED'
*    INFORMIX 'ORDERED'
*    MSSQLNT  'OPTION FORCE ORDER'
*    DB6 '<NLJOIN><IXSCAN TABLE=''MSEG'' SAP_INDEX=''M''/>'
*    DB6 '<IXSCAN TABLE=''MKPF'' SAP_INDEX=''0''/></NLJOIN>'.
*
*  ELSEIF  pa_dbdat = 'X'.
*    PERFORM hdb_check_table USING 'MKPF' 'MSEG'.
*    SELECT (g_t_mseg_fields)
*         INTO CORRESPONDING FIELDS OF TABLE g_t_mseg_lean
*         FROM mkpf AS mkpf  JOIN mseg AS mseg
*                  ON mkpf~mandt  =  mseg~mandt  AND
*                     mkpf~mblnr  =  mseg~mblnr  AND
*                     mkpf~mjahr  =  mseg~mjahr
*         CONNECTION (dbcon)
*         WHERE mseg~matnr  IN  matnr
*           AND mseg~werks  IN  g_ra_werks
*           AND mseg~lgort  IN  g_ra_lgort
*           AND mseg~charg  IN  charg
*           AND mseg~bwtar  IN  bwtar
*           AND mseg~bwart  IN  bwart
*           AND mkpf~budat  GE  datum-low
*           AND mseg~sobkz  IN  g_ra_sobkz
*           AND matnr IN ( SELECT matnr FROM mseg WHERE insmk = 'X' OR insmk = 2 ) "bmierzwi 26.10.2021 -> the reason for the enhancement.
*    %_HINTS
*    INFORMIX 'ORDERED'
*    ADABAS 'ORDERED'
*    MSSQLNT  'OPTION FORCE ORDER'
*    DB6 '<NLJOIN><IXSCAN TABLE=''MKPF'' SAP_INDEX=''BUD''/>'
*    DB6 '<IXSCAN TABLE=''MSEG'' SAP_INDEX=''0''/></NLJOIN>'.
*  ELSE.
*
*    MOVE  1                  TO  sy-subrc.
*  ENDIF.
*
* ELSE.
*
*  IF g_f_msegex_act = 'H'.
*
*    PERFORM hdb_check_table USING 'MKPF' 'MSEG'.
*    SELECT (G_T_MSEG_FIELDS)
*         INTO CORRESPONDING FIELDS OF TABLE G_T_MSEG_LEAN
*         FROM MKPF AS MKPF  JOIN MSEG AS MSEG
*                  ON MKPF~MANDT  =  MSEG~MANDT  AND
*                     MKPF~MBLNR  =  MSEG~MBLNR  AND
*                     MKPF~MJAHR  =  MSEG~MJAHR
*         CONNECTION (dbcon)
*         WHERE MSEG~MATNR       IN  MATNR
*           AND MSEG~WERKS       IN  G_RA_WERKS
*           AND MSEG~LGORT       IN  G_RA_LGORT
*           AND MSEG~CHARG       IN  CHARG
*           AND MSEG~BWTAR       IN  BWTAR
*           AND MSEG~BWART       IN  BWART
*           AND MSEG~BUDAT_MKPF  GE  DATUM-LOW
*           AND MSEG~SOBKZ       IN  G_RA_SOBKZ
*           AND matnr IN ( SELECT matnr FROM mseg WHERE insmk = 'X' OR insmk = 2 ) "bmierzwi 26.10.2021 -> the reason for the enhancement.
*    %_HINTS
*    DB2    '&SUBSTITUTE VALUES&'
*    ORACLE '&SUBSTITUTE VALUES&'.
*  ELSE.
*        PERFORM hdb_check_table USING 'MKPF' 'MSEG'.
*        SELECT (G_T_MSEG_FIELDS)
*         INTO CORRESPONDING FIELDS OF TABLE G_T_MSEG_LEAN
*         FROM MKPF AS MKPF  JOIN MSEG AS MSEG
*                  ON MKPF~MANDT  =  MSEG~MANDT  AND
*                     MKPF~MBLNR  =  MSEG~MBLNR  AND
*                     MKPF~MJAHR  =  MSEG~MJAHR
*         CONNECTION (dbcon)
*         WHERE MSEG~MATNR       IN  MATNR
*           AND MSEG~WERKS       IN  G_RA_WERKS
*           AND MSEG~LGORT       IN  G_RA_LGORT
*           AND MSEG~CHARG       IN  CHARG
*           AND MSEG~BWTAR       IN  BWTAR
*           AND MSEG~BWART       IN  BWART
*           AND MSEG~BUDAT_MKPF  GE  DATUM-LOW
*           AND MSEG~SOBKZ       IN  G_RA_SOBKZ
*           AND matnr IN ( SELECT matnr FROM mseg WHERE insmk = 'X' OR insmk = 2 ). "bmierzwi 26.10.2021 -> the reason for the enhancement.
*  ENDIF.
* ENDIF.
*
* ELSEIF storage = 'XSPEME'.
*    BREAK-POINT                ID mmim_rep_mb5b.
*
* IF g_f_msegex_act is initial.
*
*  IF      pa_dbstd = 'X'.
*    PERFORM hdb_check_table USING 'MKPF' 'MSEG'.
*    SELECT (g_t_mseg_fields)
*         INTO CORRESPONDING FIELDS OF TABLE g_t_mseg_lean
*         FROM mkpf AS mkpf  JOIN mseg AS mseg
*                  ON mkpf~mandt  =  mseg~mandt  AND
*                     mkpf~mblnr  =  mseg~mblnr  AND
*                     mkpf~mjahr  =  mseg~mjahr
*         CONNECTION (dbcon)
*         WHERE mseg~matnr  IN  matnr
*           AND mseg~werks  IN  g_ra_werks
*           AND mseg~lgort  IN  g_ra_lgort
*           AND mseg~charg  IN  charg
*           AND mseg~bwtar  IN  bwtar
*           AND mseg~bwart  IN  bwart
*           AND mkpf~budat  GE  datum-low
*           AND mseg~sobkz  IN  g_ra_sobkz
*           AND matnr IN ( SELECT matnr FROM mseg WHERE insmk = 'S' OR insmk = 3 ) "bmierzwi 26.10.2021 -> the reason for the enhancement.
*    %_HINTS
*    DB2    '&SUBSTITUTE VALUES&'
*    ORACLE '&SUBSTITUTE VALUES&'.
*
*  ELSEIF  pa_dbmat = 'X'.
*    PERFORM hdb_check_table USING 'MKPF' 'MSEG'.
*    SELECT (g_t_mseg_fields)
*         INTO CORRESPONDING FIELDS OF TABLE g_t_mseg_lean
*         FROM mseg AS mseg  JOIN mkpf AS mkpf
*                  ON mkpf~mandt  =  mseg~mandt  AND
*                     mkpf~mblnr  =  mseg~mblnr  AND
*                     mkpf~mjahr  =  mseg~mjahr
*         CONNECTION (dbcon)
*         WHERE mseg~matnr  IN  matnr
*           AND mseg~werks  IN  g_ra_werks
*           AND mseg~lgort  IN  g_ra_lgort
*           AND mseg~charg  IN  charg
*           AND mseg~bwtar  IN  bwtar
*           AND mseg~bwart  IN  bwart
*           AND mkpf~budat  GE  datum-low
*           AND mseg~sobkz  IN  g_ra_sobkz
*           AND matnr IN ( SELECT matnr FROM mseg WHERE insmk = 'S' OR insmk = 3 ) "bmierzwi 26.10.2021 -> the reason for the enhancement.
*    %_HINTS
*    ADABAS   'ORDERED'
*    INFORMIX 'ORDERED'
*    MSSQLNT  'OPTION FORCE ORDER'
*    DB6 '<NLJOIN><IXSCAN TABLE=''MSEG'' SAP_INDEX=''M''/>'
*    DB6 '<IXSCAN TABLE=''MKPF'' SAP_INDEX=''0''/></NLJOIN>'.
*
*  ELSEIF  pa_dbdat = 'X'.
*    PERFORM hdb_check_table USING 'MKPF' 'MSEG'.
*    SELECT (g_t_mseg_fields)
*         INTO CORRESPONDING FIELDS OF TABLE g_t_mseg_lean
*         FROM mkpf AS mkpf  JOIN mseg AS mseg
*                  ON mkpf~mandt  =  mseg~mandt  AND
*                     mkpf~mblnr  =  mseg~mblnr  AND
*                     mkpf~mjahr  =  mseg~mjahr
*         CONNECTION (dbcon)
*         WHERE mseg~matnr  IN  matnr
*           AND mseg~werks  IN  g_ra_werks
*           AND mseg~lgort  IN  g_ra_lgort
*           AND mseg~charg  IN  charg
*           AND mseg~bwtar  IN  bwtar
*           AND mseg~bwart  IN  bwart
*           AND mkpf~budat  GE  datum-low
*           AND mseg~sobkz  IN  g_ra_sobkz
*           AND matnr IN ( SELECT matnr FROM mseg WHERE insmk = 'S' OR insmk = 3 ) "bmierzwi 26.10.2021 -> the reason for the enhancement.
*    %_HINTS
*    INFORMIX 'ORDERED'
*    ADABAS 'ORDERED'
*    MSSQLNT  'OPTION FORCE ORDER'
*    DB6 '<NLJOIN><IXSCAN TABLE=''MKPF'' SAP_INDEX=''BUD''/>'
*    DB6 '<IXSCAN TABLE=''MSEG'' SAP_INDEX=''0''/></NLJOIN>'.
*  ELSE.
*
*    MOVE  1                  TO  sy-subrc.
*  ENDIF.
*
* ELSE.
*
*  IF g_f_msegex_act = 'H'.
*
*    PERFORM hdb_check_table USING 'MKPF' 'MSEG'.
*    SELECT (G_T_MSEG_FIELDS)
*         INTO CORRESPONDING FIELDS OF TABLE G_T_MSEG_LEAN
*         FROM MKPF AS MKPF  JOIN MSEG AS MSEG
*                  ON MKPF~MANDT  =  MSEG~MANDT  AND
*                     MKPF~MBLNR  =  MSEG~MBLNR  AND
*                     MKPF~MJAHR  =  MSEG~MJAHR
*         CONNECTION (dbcon)
*         WHERE MSEG~MATNR       IN  MATNR
*           AND MSEG~WERKS       IN  G_RA_WERKS
*           AND MSEG~LGORT       IN  G_RA_LGORT
*           AND MSEG~CHARG       IN  CHARG
*           AND MSEG~BWTAR       IN  BWTAR
*           AND MSEG~BWART       IN  BWART
*           AND MSEG~BUDAT_MKPF  GE  DATUM-LOW
*           AND MSEG~SOBKZ       IN  G_RA_SOBKZ
*           AND matnr IN ( SELECT matnr FROM mseg WHERE insmk = 'S' OR insmk = 3 ) "bmierzwi 26.10.2021 -> the reason for the enhancement.
*    %_HINTS
*    DB2    '&SUBSTITUTE VALUES&'
*    ORACLE '&SUBSTITUTE VALUES&'.
*  ELSE.
*        PERFORM hdb_check_table USING 'MKPF' 'MSEG'.
*        SELECT (G_T_MSEG_FIELDS)
*         INTO CORRESPONDING FIELDS OF TABLE G_T_MSEG_LEAN
*         FROM MKPF AS MKPF  JOIN MSEG AS MSEG
*                  ON MKPF~MANDT  =  MSEG~MANDT  AND
*                     MKPF~MBLNR  =  MSEG~MBLNR  AND
*                     MKPF~MJAHR  =  MSEG~MJAHR
*         CONNECTION (dbcon)
*         WHERE MSEG~MATNR       IN  MATNR
*           AND MSEG~WERKS       IN  G_RA_WERKS
*           AND MSEG~LGORT       IN  G_RA_LGORT
*           AND MSEG~CHARG       IN  CHARG
*           AND MSEG~BWTAR       IN  BWTAR
*           AND MSEG~BWART       IN  BWART
*           AND MSEG~BUDAT_MKPF  GE  DATUM-LOW
*           AND MSEG~SOBKZ       IN  G_RA_SOBKZ
*           AND matnr IN ( SELECT matnr FROM mseg WHERE insmk = 'S' OR insmk = 3 ). "bmierzwi 26.10.2021 -> the reason for the enhancement.
*  ENDIF.
* ENDIF.

*ELSE.

************************************************************************************************
*THE LOGIC FOR ZWIEKOWANIE_PARTIA
************************************************************************************************
*TABLES: mseg.
*
*DATA: p_matnr LIKE mseg-matnr.
*
*TYPES: BEGIN OF it_charg,
*  matnr LIKE mseg-matnr,
*  charg LIKE mseg-charg,
*  END OF it_charg.
*
*DATA: imp_mseg  TYPE STANDARD TABLE OF mseg WITH HEADER LINE,
*      wa_mseg   TYPE mseg,
*
*      imp_charg TYPE STANDARD TABLE OF it_charg,
*      wa_charg  TYPE it_charg.
*
*p_matnr = 'W0430'.
*
**Zwraca wszystko opr�cz CHARG�w
*SELECT matnr charg dmbtr erfmg UP TO 20 ROWS
*FROM mseg
*INTO CORRESPONDING FIELDS OF TABLE imp_mseg
*WHERE charg = 'K37100301'.
*
*LOOP AT imp_mseg INTO wa_mseg.
*  WRITE: / 'MATNR ', wa_mseg-matnr, 'CHARG ', wa_mseg-charg, 'DMBTR ', wa_mseg-dmbtr, 'ERFMG ', wa_mseg-erfmg.
*ENDLOOP.

*SELECT charg zwraca CHARGi jak nale�y, ale SELECT matnr charg... zwraca ju� tylko matnr.
*SELECT matnr charg
*FROM mseg
*INTO TABLE imp_charg
*WHERE matnr = p_matnr.
*
*LOOP AT imp_charg INTO wa_charg.
*  WRITE: / wa_charg-matnr, wa_charg-charg.
*ENDLOOP.

********** START -> USUN��EM TO ZE ZWIEKOWANIA 03.11.2021*******************************************************
*---------------------------------------------------------
*----------START OF ADDED BY BMIERZWI 16.09.2021----------
*---------------------------------------------------------
*Adding a column with the "nr partii materia�u".
*    SELECT SINGLE charg INTO ls_outtab-charg_d FROM mcha
*      WHERE matnr = ls_s031_mara-matnr.

*---------------------------------------------------------
*----------END OF ADDED BY BMIERZWI 16.09.2021------------
*---------------------------------------------------------
********** END -> USUN��EM TO ZE ZWIEKOWANIA 03.11.2021*******************************************************

*ABSOLUTNIE FENOMENALNE KOD SKOPIOWANY Z ZWM_WIEKOWANIE_PARTIA, KT�RY CHYBA S�U�Y� MI NA POCZ�TKU, GDY PODJ��EM PR�B� ZROBIENIA GO OD NOWA
***************************************************************************ABSOLUTNIE FENOMENALNY KOD 28.10.2021***************************************************************************
*START-OF-SELECTION.
*  DATA: sy_tabix TYPE sy-tabix.
*  DATA: ls_kschl TYPE kschl.
*
*TYPES: BEGIN OF it_charg,
*  matnr LIKE mseg-matnr,
*  charg LIKE mseg-charg,
*  END OF it_charg.
*
*DATA: imp_mseg  TYPE STANDARD TABLE OF mseg WITH HEADER LINE,
*      wa_mseg   TYPE mseg,
*
*      imp_charg TYPE STANDARD TABLE OF it_charg,
*      wa_charg  TYPE it_charg.
*
*p_matnr = 'W0430'.
*
**Zwraca wszystko opr�cz CHARG�w
*SELECT matnr charg dmbtr erfmg UP TO 20 ROWS
*FROM mseg
*INTO CORRESPONDING FIELDS OF TABLE imp_mseg
*WHERE charg = 'K37100301'.
*
*LOOP AT imp_mseg INTO wa_mseg.
*  WRITE: / 'MATNR ', wa_mseg-matnr, 'CHARG ', wa_mseg-charg, 'DMBTR ', wa_mseg-dmbtr, 'ERFMG ', wa_mseg-erfmg.
*ENDLOOP.


***************************************************************************ABSOLUTNIE FENOMENALNY KOD 28.10.2021***************************************************************************

****START -> OSTATECZNY KOD ZWM_ZWIEKOWANIE_PARTIA, KT�RY USUWA PUSTE CHARGi ORAZ DUPLIKATY****
*TYPES: BEGIN OF it_mseg,
*  matnr LIKE mseg-matnr,
*  charg LIKE mseg-charg,
*  dmbtr LIKE mseg-dmbtr,
*  erfmg LIKE mseg-erfmg,
*  END OF it_mseg.
*
*DATA: imp_mseg  TYPE STANDARD TABLE OF it_mseg WITH HEADER LINE.
*FIELD-SYMBOLS: <fs_mseg> TYPE it_mseg.
*
**To select the batch number and two columns with values possible to attach to certain batch numbers.
*SELECT matnr charg dmbtr erfmg
*FROM mseg
*INTO CORRESPONDING FIELDS OF TABLE imp_mseg
*WHERE matnr = ls_outtab-matnr.
*
*LOOP AT gt_outtab INTO gs_outtab.
*  CLEAR gs_outtab_final.
*  gs_outtab_final-matnr  = gs_outtab-matnr.
*  gs_outtab_final-invent = gs_outtab-invent.
*  gs_outtab_final-vstprs = gs_outtab-vstprs.
*  gs_outtab_final-vstpre = gs_outtab-vstpre.
*  gs_outtab_final-vstprb = gs_outtab-vstprb.
*  gs_outtab_final-maktx  = gs_outtab-maktx.
*  gs_outtab_final-matkl  = gs_outtab-matkl.
*  gs_outtab_final-volum  = gs_outtab-volum.
*  gs_outtab_final-alkoh  = gs_outtab-alkoh.
*  gs_outtab_final-mtstb  = gs_outtab-mtstb.
*  gs_outtab_final-mtart  = gs_outtab-mtart.
*  gs_outtab_final-meins  = gs_outtab-meins.
*  gs_outtab_final-labst  = gs_outtab-labst.
*  gs_outtab_final-over   = gs_outtab-over.
*  gs_outtab_final-erfme  = gs_outtab-erfme.
*
*  SORT imp_mseg BY charg.
*  DELETE ADJACENT DUPLICATES FROM imp_mseg COMPARING charg.
**Every material needs to be displayed as many times as it has batches attached to it. Where possible - data should be divided between their respective batches.
*    LOOP AT imp_mseg ASSIGNING <fs_mseg> WHERE charg NE ''.
*      gs_outtab_final-charg_d = <fs_mseg>-charg.
*      gs_outtab_final-dmbtr   = <fs_mseg>-dmbtr.
*      gs_outtab_final-erfmg   = <fs_mseg>-erfmg.
*      APPEND gs_outtab_final TO gt_outtab_final.
*    ENDLOOP.
*ENDLOOP.
****END -> OSTATECZNY KOD ZWM_ZWIEKOWANIE_PARTIA, KT�RY USUWA PUSTE CHARGi ORAZ DUPLIKATY****







*************************************************************************************************
**START - TESTS FOR ZPRLI
*************************************************************************************************
*DATA: BEGIN OF gt_price OCCURS 0,
*      kunnr LIKE knvv-kunnr,
*      vkorg LIKE knvv-vkorg,
*      vtweg LIKE knvv-vtweg,
*      matnr LIKE mara-matnr,
*      matkl LIKE mara-matkl,
*      knumh LIKE a005-knumh,
*      pltyp LIKE a502-pltyp,       "
*      table(4) TYPE c,
*      END OF gt_price,
*
*      BEGIN OF gt_price3 OCCURS 0,
*      kunwe LIKE a503-kunwe,
*      pltyp LIKE a502-pltyp,
*      kunnr LIKE a501-kunnr,
*      knumh LIKE a501-knumh,
*      provg LIKE a501-provg,
*      table(4) TYPE c,
*      END OF gt_price3.
*      DATA: BEGIN OF gt_price1 OCCURS 0,
*      kunnr LIKE knvv-kunnr,
*      vkorg LIKE knvv-vkorg,
*      vtweg LIKE knvv-vtweg,
*      matnr LIKE mara-matnr,
*      matkl like mara-matkl,
*      knumh LIKE a005-knumh,
*      pltyp LIKE a502-pltyp, "bmierzwi 09.11.2021
*      table(4) type c,
*      END OF gt_price1.
*      DATA: BEGIN OF gt_price2 OCCURS 0,
*      kunnr LIKE knvv-kunnr,
*      vkorg LIKE knvv-vkorg,
*      vtweg LIKE knvv-vtweg,
*      matnr LIKE mara-matnr,
*      matkl like mara-matkl,
*      knumh LIKE a005-knumh,
*      table(4) type c,
*      END OF gt_price2.
*
*break bmierzwi.
*
*FIELD-SYMBOLS: <f1> LIKE gt_price1, <f2> LIKE gt_price2, <f3> LIKE gt_price3.
*DATA: gt_price_knumh TYPE a005-knumh,
*      lv_table(4).
*DATA: lv_loevm_ko_1 LIKE konp-loevm_ko.
******************************************************************************************************
******************************************************************************************************
******************************************************************************************************
*lv_table = 'a501'.
*REFRESH gt_price3.
*REFRESH gt_price2.
*REFRESH gt_price1.
*SELECT *
*      INTO CORRESPONDING FIELDS OF TABLE gt_price1
*      FROM a501
*     WHERE kappl = 'V'
*       AND kschl = 'Z001'
*       AND provg = '02'
*       AND datbi => '10.11.2021'.
*       IF sy-subrc = 0.
*         SELECT * INTO CORRESPONDING FIELDS OF TABLE gt_price2 FROM mara FOR ALL ENTRIES IN gt_price1 WHERE knumh = gt_price1-knumh. "MARA has no knumh
*       ENDIF.
*LOOP AT gt_price2 ASSIGNING <f2>.
*  READ TABLE gt_price1 ASSIGNING <f1> WITH KEY matkl = <f2>-matkl.
*  IF sy-subrc = 0.
*    <f1>-table = lv_table.
*    READ TABLE gt_price WITH KEY matnr = <f2>-matnr.
*      IF sy-subrc = 0.
*        MOVE-CORRESPONDING <f1> TO gt_price.
*        gt_price-matnr = <f2>-matnr.
*        gt_price_knumh = gt_price-knumh.
*        PERFORM read_lv_loevm_ko_1 USING gt_price_knumh CHANGING lv_loevm_ko_1.
*        if lv_LOEVM_KO_1 = 'X'.
*            clear gt_price.
*          else.
*            append gt_price.
*          endif.
*      ENDIF.
*  ENDIF.
*ENDLOOP.
*
*WRITE: / gt_price-kunnr,
*         gt_price-vkorg,
*         gt_price-vtweg,
*         gt_price-matnr,
*         gt_price-matnr,
*         gt_price-knumh,
*         gt_price-pltyp,
*         gt_price-table.
*
*
**&---------------------------------------------------------------------*
**&      Form  READ_lv_LOEVM_KO_1
**&---------------------------------------------------------------------*
**       text
**----------------------------------------------------------------------*
**      -->GT_PRICE_KNUMH  text
**      <--LV_LOEVM_KO_1   text
**----------------------------------------------------------------------*
*FORM read_lv_loevm_ko_1 USING gt_price_knumh
*                        CHANGING lv_loevm_ko_1.
*  CLEAR: lv_loevm_ko_1.
*
*  SELECT SINGLE loevm_ko
*           INTO lv_loevm_ko_1
*           FROM konp
*          WHERE knumh = gt_price-knumh.
*
*ENDFORM.                    "READ_lv_LOEVM_KO_1
************************************************************************************************
*END - TESTS FOR ZPRLI
*************************************************************************************************







************************************************************************************************
*START - TESTS FOR SQ02-Z_SD_STATUSY_ZAMOWIEN
************************************************************************************************
*data: first_hol LIKE vbfa-vbeln,
*      matnr_hol LIKE lips-matnr,
*      vrkme_hol LIKE lips-vrkme.
*
*SELECT SINGLE vbeln INTO (first_hol) FROM VBFA
*  WHERE vbelv = '3340000000' "Confirmed example
*  AND vbtyp_n = 'J'.
*SELECT SINGLE matnr vrkme INTO (matnr_hol, vrkme_hol) FROM LIPS
*  WHERE vbeln = first_hol.
*  WRITE: matnr_hol.
*  WRITE: vrkme_hol.

************************************************************************************************
*END - TESTS FOR SQ02-Z_SD_STATUSY_ZAMOWIEN
************************************************************************************************