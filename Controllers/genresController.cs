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
    public class genresController : ApiController
    {
        private huduEntities db = new huduEntities();

        // GET: api/genres
        public IQueryable<genre> Getgenres()
        {
            return db.genres;
        }

        // GET: api/genres/5
        [ResponseType(typeof(genre))]
        public async Task<IHttpActionResult> Getgenre(int id)
        {
            genre genre = await db.genres.FindAsync(id);
            if (genre == null)
            {
                return NotFound();
            }

            return Ok(genre);
        }

        // PUT: api/genres/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> Putgenre(int id, genre genre)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != genre.genre_id)
            {
                return BadRequest();
            }

            db.Entry(genre).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!genreExists(id))
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

        // POST: api/genres
        [ResponseType(typeof(genre))]
        public async Task<IHttpActionResult> Postgenre(genre genre)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.genres.Add(genre);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = genre.genre_id }, genre);
        }

        // DELETE: api/genres/5
        [ResponseType(typeof(genre))]
        public async Task<IHttpActionResult> Deletegenre(int id)
        {
            genre genre = await db.genres.FindAsync(id);
            if (genre == null)
            {
                return NotFound();
            }

            db.genres.Remove(genre);
            await db.SaveChangesAsync();

            return Ok(genre);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool genreExists(int id)
        {
            return db.genres.Count(e => e.genre_id == id) > 0;
        }
    }
}