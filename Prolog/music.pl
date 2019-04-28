plays(dave_brubeck, piano).
plays(alex_turner, guitar).
plays(angus_young, guitar).
plays(chris_slade, drums).
plays(stevie_young, guitar).
plays(axl_rose, vocal).
plays(stanley_stevenson_byrne, synth).

band_member(dave_brubeck, dave_brubeck_quartet).
band_member(alex_turner, arctic_monkeys).
band_member(angus_young, acdc).
band_member(chris_slade, acdc).
band_member(stevie_young, acdc).
band_member(axl_rose, acdc).
band_member(stanley_stevenson_byrne, fox_stevenson).

genre(dave_brubeck_quartet, jazz).
genre(arctic_monkeys, rock).
genre(acdc, rock).
genre(fox_stevenson, electronic).

musician_genre(X, Y) :- band_member(X, Z), genre(Z, Y).

%identify dave brubeck's genre with the following query:
% ?- musician_genre(dave_brubeck, X).

%all musicians that play guitar:
% ?- plays(X, guitar).