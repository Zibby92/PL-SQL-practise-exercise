-- przyk³ad
DECLARE
    -- kolekcja asocjacyjna
    TYPE typ_at IS TABLE OF VARCHAR2(15) INDEX BY PLS_INTEGER;
    kolekcja_at typ_at;
    -- kolekcja zagnie¿d¿ona
    TYPE typ_nt IS TABLE OF VARCHAR2(15);
    kolekcja_nt typ_nt;
    -- kolekcja varray
    TYPE typ_vt IS VARRAY(5) OF VARCHAR2(15);
    kolekcja_vt typ_vt;
BEGIN
    NULL;
END;
/
