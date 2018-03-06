picking_out_clothes:

    Initialize OutfitArray to []

    WHILE UnderwearDrawer is not empty
        add TopPair to OutfitArray
    ENDWHILE

    FOR each Pant in PantsArrayOnFloor
        WHILE OutfitArray does not include Pant
            UNLESS Pant looks filthy
                add Pant to OutfitArray
            ENDUNLESS
        ENDWHILE
    END FOR

    IF work today THEN
        WHILE PoloCollection is not empty
            add TopPolo to OutfitArray
        ENDWHILE
    ELSE 
        add TopTShirt to OutfitArray
    ENDIF

    IF weather looks inclement THEN
        IF SocksDrawer includes LongSocks THEN
            add LongSocks to OutfitArray
        ELSE
            remove LongSocks from DirtyLaundry
            add LongSocks to OutfitArray
        ENDIF
        add Boots to OutfitArray
        add Coat to OutfitArray
    ELSE
        IF SocksDrawer includes ShortSocks
            add ShortSocks to OutfitArray
        ELSE 
            add LongSocks to OutfitArray
        ENDIF
        add Vans to OutfitArray
        add Hoodie to OutfitArray
    ENDIF
end picking_out_clothes


getting breakfast:

    Initialize BreakfastSetting
        SET Bowl to empty
        SET Mug to empty
    END Initialize

    WHILE coffee.amount < Mug.volume
        coffee = GrindAndSteep(coffee_beans)
    ENDWHILE

    add coffee to Mug

    IF fridge includes oatmeal
        add oatmeal to Bowl
    ELSE 
        add cereal to Bowl
        add milk to Bowl
    ENDIF

    add fruit(2) to Bowl

end breakfast

MakingPlansWith(friend)
    IF it is an emergency && there is nobody else THEN
        drive friend to the hospital
    ELSE
        FOR each day of the_week
            IF i have plans that day
                print "Sorry i am driving someone to the hospital. they couldnt find another ride"
            ELSE
                print "Sorry I have to work on my Bloc homework. i am very seriously behind"
            ENDIF
        END FOR
    ENDIF
    return nil
END


