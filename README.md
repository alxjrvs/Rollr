#Rollr
**Rand() for the Rest of Us**
======

**Rollr** is a gem that helps you roll Die. Here's the basic way to use it:

> D4.roll

It comes with preset constants for popular dice sizes, from D3 to D20. This rolls a single four sided die. Now, lets roll several!

> D4.roll(20)

Now we just rolled 20 Four sided die... for some reason. That's not up for me to figure out.

Recently added: Primitive logging! Every die has a 'rolls' array, and can see the individual dice rolled in a given group roll by calling it.

>  D6.roll 3
> D6.rolls.last
> [4,5,3]

Oof. Tough break, roller.

Any questions, comments, concerns? [Email me](mailto:alxjrvs@gmail.com "Alex's Email"). Want to make it better? Make a pull request.




-- By [Alxjrvs](http://alxjrvs.com "Alxjrvs") --
