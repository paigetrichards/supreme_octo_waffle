### my goal is to make sure only setosa is left
iris %>% 
    filter(Species == "setosa") -> hopefully_setosa
    
# but did I do it right?! 
# If I did, then all species left will be setosa.
# Ie if I did it right, then this output will have no rows:
hopefully_setosa %>%
    filter(Species !="setosa")
    
## ok so tally() tells me how many rows, right? how can I use that 0 directly though?!!
hopefully_setosa %>%
    filter(Species !="setosa") %>%
    tally()

# pull the column "n" out into its own variable and work with it!
hopefully_setosa %>%
    filter(Species !="setosa") %>%
    tally() %>%
    pull(n) -> values_in_column_n_in_own_array

if (values_in_column_n_in_own_array != 0){
    stop("bad news!")
}

## or, you can hate pull. it's not needed. this is about the CONCEPT of ASSERTING TRUTHS
hopefully_setosa %>%
    filter(Species !="setosa") %>%
    tally() -> hopefully_setosa_check


if (hopefully_setosa_check$n != 0){
    stop("bad news!")
}