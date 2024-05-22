package com.example.demo.repository;

// 필요한 클래스 및 어노테이션을 임포트
import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.example.demo.vo.Article;
import com.example.demo.vo.topdb;

// MyBatis Mapper 인터페이스를 나타내는 어노테이션
@Mapper
public interface ArticleRepository {

    // 'topdb' 테이블에서 모든 레코드를 가져오는 메서드
    @Select("""
            SELECT *
            FROM topdb
            """)
    public List<topdb> getForMushionSuggestList();

    // 새로운 게시글을 'article' 테이블에 추가하는 메서드
    @Insert("""
            INSERT INTO
            article SET
            regDate = NOW(),
            updateDate = NOW(),
            memberId = #{memberId},
            boardId = #{boardId},
            title = #{title}, `body` = #{body}
            """)
    public void writeArticle(int memberId, String title, String body, int boardId);

    // 마지막으로 삽입된 레코드의 ID를 가져오는 메서드
    @Select("SELECT LAST_INSERT_ID()")
    public int getLastInsertId();

    // 특정 ID의 게시글을 가져오는 메서드
    @Select("""
            SELECT *
            FROM article
            WHERE id = #{id}
            """)
    public Article getArticle(int id);

    // 특정 ID의 게시글과 작성자의 닉네임을 가져오는 메서드
    @Select("""
            <script>
                SELECT A.*, M.nickname AS extra__writer
                FROM article AS A
                INNER JOIN `member` AS M
                ON A.memberId = M.id
                WHERE A.id = #{id}
                GROUP BY A.id
            </script>
                """)
    public Article getForPrintArticle(int id);

    // 특정 ID의 게시글을 삭제하는 메서드
    @Delete("DELETE FROM article WHERE id = #{id}")
    public void deleteArticle(int id);

    // 특정 ID의 게시글을 수정하는 메서드, 제목과 본문을 선택적으로 업데이트 가능
    @Update("""
            <script>
            UPDATE article
                <set>
                    <if test="title != null and title != ''">title = #{title},</if>
                    <if test="body != null and body != ''">`body` = #{body},</if>
                    updateDate = NOW()
                </set>
            WHERE id = #{id}
            </script>
                """)
    public void modifyArticle(int id, String title, String body);

    // 모든 게시글과 작성자의 닉네임을 가져오는 메서드, 게시글 ID 기준 내림차순 정렬
    @Select("""
            SELECT A.*, M.nickname AS extra__writer
            FROM article AS A
            INNER JOIN `member` AS M
            ON A.memberId = M.id
            ORDER BY A.id DESC
            """)
    public List<Article> getArticles();

    // 특정 조건에 맞는 게시글의 수를 가져오는 메서드
    @Select("""
            <script>
            SELECT COUNT(*) AS cnt
            FROM article AS A
            WHERE 1
            <if test="boardId != 0">
                AND boardId = #{boardId}
            </if>
            <if test="searchKeyword != ''">
                <choose>
                    <when test="searchKeywordTypeCode == 'title'">
                        AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
                    </when>
                    <when test="searchKeywordTypeCode == 'body'">
                        AND A.body LIKE CONCAT('%',#{searchKeyword},'%')
                    </when>
                    <otherwise>
                        AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
                        OR A.body LIKE CONCAT('%',#{searchKeyword},'%')
                    </otherwise>
                </choose>
            </if>
            ORDER BY id DESC
            </script>
            """)
    public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword);

    // 특정 게시글의 조회수를 증가시키는 메서드
    @Update("""
            UPDATE article
            SET hitCount = hitCount + 1
            WHERE id = #{id}
            """)
    public int increaseHitCount(int id);

    // 특정 게시글의 조회수를 가져오는 메서드
    @Select("""
            SELECT hitCount
            FROM article
            WHERE id = #{id}
            """)
    public int getArticleHitCount(int id);

    // 특정 조건에 맞는 게시글 목록을 가져오는 메서드, 작성자 닉네임 및 댓글 수 포함
    @Select("""
            <script>
            SELECT A.*, M.nickname AS extra__writer, IFNULL(COUNT(R.id),0) AS extra__repliesCnt
            FROM article AS A
            INNER JOIN `member` AS M
            ON A.memberId = M.id
            LEFT JOIN `reply` AS R
            ON A.id = R.relId
            WHERE 1
            <if test="boardId != 0">
                AND A.boardId = #{boardId}
            </if>
            <if test="searchKeyword != ''">
                <choose>
                    <when test="searchKeywordTypeCode == 'title'">
                        AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
                    </when>
                    <when test="searchKeywordTypeCode == 'body'">
                        AND A.body LIKE CONCAT('%',#{searchKeyword},'%')
                    </when>
                    <otherwise>
                        AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
                        OR A.body LIKE CONCAT('%',#{searchKeyword},'%')
                    </otherwise>
                </choose>
            </if>
            GROUP BY A.id
            ORDER BY A.id DESC
            <if test="limitFrom >= 0 ">
                LIMIT #{limitFrom}, #{limitTake}
            </if>
            </script>
            """)
    public List<Article> getForPrintArticles(int boardId, int limitFrom, int limitTake, String searchKeywordTypeCode, String searchKeyword);

    // 특정 게시글의 좋아요 리액션 포인트를 증가시키는 메서드
    @Update("""
            UPDATE article
            SET goodReactionPoint = goodReactionPoint + 1
            WHERE id = #{relId}
            """)
    public int increaseGoodReactionPoint(int relId);

    // 특정 게시글의 좋아요 리액션 포인트를 감소시키는 메서드
    @Update("""
            UPDATE article
            SET goodReactionPoint = goodReactionPoint - 1
            WHERE id = #{relId}
            """)
    public int decreaseGoodReactionPoint(int relId);

    // 특정 게시글의 싫어요 리액션 포인트를 증가시키는 메서드
    @Update("""
            UPDATE article
            SET badReactionPoint = badReactionPoint + 1
            WHERE id = #{relId}
            """)
    public int increaseBadReactionPoint(int relId);

    // 특정 게시글의 싫어요 리액션 포인트를 감소시키는 메서드
    @Update("""
            UPDATE article
            SET badReactionPoint = badReactionPoint - 1
            WHERE id = #{relId}
            """)
    public int decreaseBadReactionPoint(int relId);

    // 특정 게시글의 좋아요 리액션 포인트를 가져오는 메서드
    @Select("""
            SELECT goodReactionPoint
            FROM article
            WHERE id = #{relId}
            """)
    public int getGoodRP(int relId);

    // 특정 게시글의 싫어요 리액션 포인트를 가져오는 메서드
    @Select("""
            SELECT badReactionPoint
            FROM article
            WHERE id = #{relId}
            """)
    public int getBadRP(int relId);

    // 현재 게시글 ID를 가져오는 메서드
    @Select("""
            SELECT MAX(id) + 1
            FROM article
            """)
    public int getCurrentArticleId();
}
