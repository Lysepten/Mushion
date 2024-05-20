package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MushionRepository;

@Service
public class MushionService {

	@Autowired
	private static MushionRepository mushionRepository;

	public MushionService(MushionRepository mushionRepository) {
		this.mushionRepository = mushionRepository;
	}


	private static final Map<String, String> GENRE_STYLES = initializeGenreStyles();

    public static String MaxGenre(String... args) {
    	
        Map<String, Integer> genreCounts = new HashMap<>();

        for (String arg : args) {
            updateGenreCounts(arg, genreCounts);
        }

        return findMaxGenre(genreCounts);
    }

    private static void updateGenreCounts(String arg, Map<String, Integer> genreCounts) {
    	
        String lowerArg = arg.toLowerCase();
        
        for (String genre : GENRE_STYLES.keySet()) {
            if (lowerArg.contains(genre.toLowerCase())) {
                genreCounts.put(genre, genreCounts.getOrDefault(genre, 0) + 1);
            }
        }
    }

    private static String findMaxGenre(Map<String, Integer> genreCounts) {
        return genreCounts.entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey)
                .orElse("");
    }

    private static Map<String, String> initializeGenreStyles() {
        Map<String, String> genreStyles = new HashMap<>();
        genreStyles.put("Jazz", "Classic");
        genreStyles.put("Hiphop", "Street");
        genreStyles.put("Rock", "Grunge");
        genreStyles.put("Pop", "Minimal");
        genreStyles.put("Blues", "Casual");
        genreStyles.put("Classical", "Classic");
        genreStyles.put("Country", "Hippie");
        genreStyles.put("Dance", "Sporty");
        genreStyles.put("Electronic", "Sporty");
        genreStyles.put("Folk", "Bohemian");
        genreStyles.put("Metal", "Biker");
        genreStyles.put("Punk", "Punk");
        genreStyles.put("Reggae", "Resort");
        genreStyles.put("RhythmAndBlues", "Vintage");
        return genreStyles;
    }

    public static List<String> getSnapshotUrlsByGenre(String genre) {
        int fashionStyleId = getFashionStyleId(genre);
        return mushionRepository.findByFashionStyleId(fashionStyleId);
    }

    private static int getFashionStyleId(String genre) {
        return switch (genre) {
            case "Jazz" -> 4;
            case "Hiphop" -> 13;
            case "Rock" -> 6;
            case "Pop" -> 8;
            case "Blues" -> 3;
            case "Classical" -> 4;
            case "Country" -> 7;
            case "Dance", "Electronic" -> 12;
            case "Folk" -> 2;
            case "Metal" -> 1;
            case "Punk" -> 9;
            case "Reggae" -> 10;
            case "RhythmAndBlues" -> 14;
            default -> 0;
        };
    }

}
