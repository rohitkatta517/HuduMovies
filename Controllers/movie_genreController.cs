using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using HuduMovie.Models;

namespace HuduMovie.Controllers
{
    public class movie_genreController : ApiController
    {
        private huduEntities db = new huduEntities();

        // GET: api/movie_genre
        public IQueryable<movie_genre> Getmovie_genre()
        {
            return db.movie_genre;
        }

        // GET: api/movie_genre/5
        [ResponseType(typeof(movie_genre))]
        public async Task<IHttpActionResult> Getmovie_genre(int id)
        {
            movie_genre movie_genre = await db.movie_genre.FindAsync(id);
            if (movie_genre == null)
            {
                return NotFound();
            }

            return Ok(movie_genre);
        }

        // PUT: api/movie_genre/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> Putmovie_genre(int id, movie_genre movie_genre)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != movie_genre.movie_genre_id)
            {
                return BadRequest();
            }

            db.Entry(movie_genre).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!movie_genreExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/movie_genre
        [ResponseType(typeof(movie_genre))]
        public async Task<IHttpActionResult> Postmovie_genre(movie_genre movie_genre)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.movie_genre.Add(movie_genre);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (movie_genreExists(movie_genre.movie_genre_id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = movie_genre.movie_genre_id }, movie_genre);
        }

        // DELETE: api/movie_genre/5
        [ResponseType(typeof(movie_genre))]
        public async Task<IHttpActionResult> Deletemovie_genre(int id)
        {
            movie_genre movie_genre = await db.movie_genre.FindAsync(id);
            if (movie_genre == null)
            {
                return NotFound();
            }

            db.movie_genre.Remove(movie_genre);
            await db.SaveChangesAsync();

            return Ok(movie_genre);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool movie_genreExists(int id)
        {
            return db.movie_genre.Count(e => e.movie_genre_id == id) > 0;
        }
    }
}