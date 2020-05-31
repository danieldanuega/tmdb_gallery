import 'package:flutter/material.dart';

const kApiKey = "99982fc47c6a0c3581c56cdcf1c86f56";

const kGenreEndpoint =
    "https://api.themoviedb.org/3/genre/movie/list?api_key=$kApiKey&language=en-US";

const kDiscoverMoviesEndpoint =
    "https://api.themoviedb.org/3/discover/movie?api_key=$kApiKey&language=en-US&sort_by=popularity.asc&include_adult=false&include_video=false";

const kColorAppBar = Color(0xFF032541);

const kImageEndpoint = "https://image.tmdb.org/t/p/w600_and_h900_bestv2";
