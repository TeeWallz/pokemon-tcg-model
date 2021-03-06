{{ config(materialized='table') }}

select
	data ->> 'id' AS id,
	data ->> 'name' as name,
	data ->> 'number' as number,
	data ->> 'rarity' as rarity,
	data ->> 'artist' as artist,
	data ->> 'supertype' as supertype,
	data -> 'subtypes' as subtypes,
	data ->> 'level' as level,
	data ->> 'hp' as hp,
	data -> 'types' as types,
	data ->> 'evolvesFrom' as evolvesFrom,
	data -> 'abilities' as abilities,
	data -> 'weaknesses' as weaknesses,
	data -> 'retreatCost' as retreatCost,
	data ->> 'convertedRetreatCost' as convertedRetreatCost,
	data -> 'nationalPokedexNumbers' as nationalPokedexNumbers,
	data -> 'legalities' as legalities,
	data -> 'legalities' ->> 'unlimited' as legality_unlimited,
	data -> 'legalities' ->> 'standard' as legality_standard,
	data -> 'legalities' ->> 'expanded' as legality_expanded,
	data -> 'images' as images,
	data -> 'images' ->> 'small' as images_small,
	data -> 'images' ->> 'large' as images_large,
	data -> 'tcgplayer' as tcgplayer
FROM {{ source('landing_tcgapi', 'ext_card') }}
