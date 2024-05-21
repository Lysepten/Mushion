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


	private static final Map<String, String> GENRE_STYLES = initializegenreStyles();

    public static String MaxGenre(String... genres) {
    	
        Map<String, Integer> genreCounts = new HashMap<>();

        for (String Genre : genres) {
            updateGenreCounts(Genre, genreCounts);
        }
        
        return findMaxGenre(genreCounts);
    }

    private static void updateGenreCounts(String Genre, Map<String, Integer> genreCounts) {
        String lowerGenre = Genre.toLowerCase();

        if (lowerGenre.contains("jazz")|| lowerGenre.contains("Jazz")) {
            genreCounts.put("Jazz", genreCounts.getOrDefault("Jazz", 0) + 1);
        }
        if (lowerGenre.contains("Hip hop") || lowerGenre.contains("hip hop") || lowerGenre.contains("rap")) {
            genreCounts.put("Hiphop", genreCounts.getOrDefault("Hiphop", 0) + 1);
        }
        if (lowerGenre.contains("rock") || lowerGenre.contains("Rock")) {
            genreCounts.put("Rock", genreCounts.getOrDefault("Rock", 0) + 1);
        }
        if (lowerGenre.contains("pop") || lowerGenre.contains("Pop")) {
            genreCounts.put("Pop", genreCounts.getOrDefault("Pop", 0) + 1);
        }
        if (lowerGenre.contains("blues") || lowerGenre.contains("Blues")) {
            genreCounts.put("Blues", genreCounts.getOrDefault("Blues", 0) + 1);
        }
        if (lowerGenre.contains("classical") || lowerGenre.contains("Classical")) {
            genreCounts.put("Classical", genreCounts.getOrDefault("Classical", 0) + 1);
        }
        if (lowerGenre.contains("country") || lowerGenre.contains("Country")) {
            genreCounts.put("Country", genreCounts.getOrDefault("Country", 0) + 1);
        }
        if (lowerGenre.contains("dance") || lowerGenre.contains("Dance")) {
            genreCounts.put("Dance", genreCounts.getOrDefault("Dance", 0) + 1);
        }
        if (lowerGenre.contains("electronic") || lowerGenre.contains("Electronic")) {
            genreCounts.put("Electronic", genreCounts.getOrDefault("Electronic", 0) + 1);
        }
        if (lowerGenre.contains("folk") || lowerGenre.contains("Folk")) {
            genreCounts.put("Folk", genreCounts.getOrDefault("Folk", 0) + 1);
        }
        if (lowerGenre.contains("metal") || lowerGenre.contains("Metal")) {
            genreCounts.put("Metal", genreCounts.getOrDefault("Metal", 0) + 1);
        }
        if (lowerGenre.contains("punk") || lowerGenre.contains("Punk")) {
            genreCounts.put("Punk", genreCounts.getOrDefault("Punk", 0) + 1);
        }
        if (lowerGenre.contains("reggae") || lowerGenre.contains("Reggae")) {
            genreCounts.put("Reggae", genreCounts.getOrDefault("Reggae", 0) + 1);
        }
        if (lowerGenre.contains("rhythmandblues") || lowerGenre.contains("r&b") || lowerGenre.contains("rnb")) {
            genreCounts.put("RhythmAndBlues", genreCounts.getOrDefault("RhythmAndBlues", 0) + 1);
        }
    }

    private static String findMaxGenre(Map<String, Integer> genreCounts) {
        return genreCounts.entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey)
                .orElse("");
    }

    public static Map<String, String> initializegenreStyles() {
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

    public List<snapshotUrl> getSnapshotUrlsByGenre(String genre) {
        int fashionStyleId = getFashionStyleId(genre);
        return mushionRepository.findByFashionStyleId(fashionStyleId);
    }

    private static int getFashionStyleId(String genre) {
        return switch (genre) {
        case "Metal" -> 1;
        case "Folk" -> 2;
        case "Blues" -> 3;
        case "Jazz" -> 4;
        case "Classical" -> 4;
        case "Rock" -> 6;
        case "Country" -> 7;
        case "Pop" -> 8;
        case "Punk" -> 9;
        case "Reggae" -> 10;
        case "Dance", "Electronic" -> 12;
        case "Hiphop" -> 13;
        case "RhythmAndBlues" -> 14;
        default -> 0;
        };
    }

}
