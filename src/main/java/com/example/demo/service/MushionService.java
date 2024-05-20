package com.example.demo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MushionRepository;
import com.example.demo.vo.snapshotUrl;

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

//    private static void updateGenreCounts(String arg, Map<String, Integer> genreCounts) {
//    	
//        String lowerArg = arg.toLowerCase();
//        
//        for (String genre : GENRE_STYLES.keySet()) {
//            if (lowerArg.contains(genre.toLowerCase())) {
//                genreCounts.put(genre, genreCounts.getOrDefault(genre, 0) + 1);
//            }
//        }
//    }
    private static void updateGenreCounts(String arg, Map<String, Integer> genreCounts) {
        String lowerArg = arg.toLowerCase();

        if (lowerArg.contains("jazz")|| lowerArg.contains("Jazz")) {
            genreCounts.put("Jazz", genreCounts.getOrDefault("Jazz", 0) + 1);
        }
        if (lowerArg.contains("Hip hop") || lowerArg.contains("hip hop") || lowerArg.contains("rap")) {
            genreCounts.put("Hiphop", genreCounts.getOrDefault("Hiphop", 0) + 1);
        }
        if (lowerArg.contains("rock") || lowerArg.contains("Rock")) {
            genreCounts.put("Rock", genreCounts.getOrDefault("Rock", 0) + 1);
        }
        if (lowerArg.contains("pop") || lowerArg.contains("Pop")) {
            genreCounts.put("Pop", genreCounts.getOrDefault("Pop", 0) + 1);
        }
        if (lowerArg.contains("blues") || lowerArg.contains("Blues")) {
            genreCounts.put("Blues", genreCounts.getOrDefault("Blues", 0) + 1);
        }
        if (lowerArg.contains("classical") || lowerArg.contains("Classical")) {
            genreCounts.put("Classical", genreCounts.getOrDefault("Classical", 0) + 1);
        }
        if (lowerArg.contains("country") || lowerArg.contains("Country")) {
            genreCounts.put("Country", genreCounts.getOrDefault("Country", 0) + 1);
        }
        if (lowerArg.contains("dance") || lowerArg.contains("Dance")) {
            genreCounts.put("Dance", genreCounts.getOrDefault("Dance", 0) + 1);
        }
        if (lowerArg.contains("electronic") || lowerArg.contains("Electronic")) {
            genreCounts.put("Electronic", genreCounts.getOrDefault("Electronic", 0) + 1);
        }
        if (lowerArg.contains("folk") || lowerArg.contains("Folk")) {
            genreCounts.put("Folk", genreCounts.getOrDefault("Folk", 0) + 1);
        }
        if (lowerArg.contains("metal") || lowerArg.contains("Metal")) {
            genreCounts.put("Metal", genreCounts.getOrDefault("Metal", 0) + 1);
        }
        if (lowerArg.contains("punk") || lowerArg.contains("Punk")) {
            genreCounts.put("Punk", genreCounts.getOrDefault("Punk", 0) + 1);
        }
        if (lowerArg.contains("reggae") || lowerArg.contains("Reggae")) {
            genreCounts.put("Reggae", genreCounts.getOrDefault("Reggae", 0) + 1);
        }
        if (lowerArg.contains("rhythmandblues") || lowerArg.contains("r&b") || lowerArg.contains("rnb")) {
            genreCounts.put("RhythmAndBlues", genreCounts.getOrDefault("RhythmAndBlues", 0) + 1);
        }
    }

    private static String findMaxGenre(Map<String, Integer> genreCounts) {
        return genreCounts.entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey)
                .orElse("");
    }

    public static Map<String, String> initializeGenreStyles() {
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
//        genreStyles.put("r&b", "Vintage");
        return genreStyles;
    }

    public List<snapshotUrl> getSnapshotUrlsByGenre(String genre) {
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
//            case "r&b" -> 14;
            default -> 0;
        };
    }

}
